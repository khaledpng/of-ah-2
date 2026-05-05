#!/bin/bash
set -e

VPS_IP="161.97.128.217"
VPS_USER="root"
GAME_DIR="$(cd "$(dirname "$0")" && pwd)"

echo ""
echo "=== اوف اح — VPS Deploy ==="
echo "Deploying to: $VPS_USER@$VPS_IP"
echo ""

# Copy SSH key to VPS so future deploys are passwordless
echo "Step 1/3: Setting up SSH key (enter your VPS password when asked)..."
ssh-copy-id -i ~/.ssh/id_ed25519.pub -o StrictHostKeyChecking=no "$VPS_USER@$VPS_IP"

# Install nginx and prepare web directory on the VPS
echo ""
echo "Step 2/3: Setting up web server on VPS..."
ssh -o StrictHostKeyChecking=no "$VPS_USER@$VPS_IP" bash << 'REMOTE'
set -e
export DEBIAN_FRONTEND=noninteractive
apt-get update -qq
apt-get install -y -qq nginx
mkdir -p /var/www/ofah
cat > /etc/nginx/sites-available/ofah << 'NGINX'
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    server_name _;
    root /var/www/ofah;
    index index.html;

    gzip on;
    gzip_types text/css application/javascript image/png;

    location ~* \.(js|css|png|jpg|gif|ico)$ {
        expires 1d;
        add_header Cache-Control "public";
    }

    location / {
        try_files $uri $uri/ /index.html;
    }
}
NGINX
ln -sf /etc/nginx/sites-available/ofah /etc/nginx/sites-enabled/ofah
rm -f /etc/nginx/sites-enabled/default
nginx -t
systemctl enable nginx
systemctl restart nginx
echo "Web server ready."
REMOTE

# Upload game files
echo ""
echo "Step 3/3: Uploading game files..."
rsync -az --progress \
  --exclude='.git' \
  --exclude='deploy.sh' \
  --exclude='.gitignore' \
  --exclude='*.log' \
  "$GAME_DIR/" "$VPS_USER@$VPS_IP:/var/www/ofah/"

echo ""
echo "✓ Done! Your game is live at:"
echo ""
echo "  http://$VPS_IP"
echo ""
