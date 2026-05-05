# Deployment Guide

## Option 1: Deploy to Railway (Recommended)

### Step 1: Push to GitHub
```bash
cd "of ah 2"
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/YOUR_USERNAME/of-ah-2.git
git branch -M main
git push -u origin main
```

### Step 2: Connect to Railway
1. Go to [railway.app](https://railway.app)
2. Sign in with GitHub
3. Click "New Project" → "Deploy from GitHub repo"
4. Select your `of-ah-2` repository
5. Railway will auto-detect Node.js and use the Procfile
6. Wait for deployment to complete

### Step 3: Get Your URL
- In Railway dashboard, find your **Domain**
- It will look like: `https://of-ah-2.up.railway.app`
- Share this link!

---

## Option 2: Deploy to Heroku (Alternative)

### Prerequisites
- Heroku CLI installed
- Heroku account

### Steps
```bash
# Login to Heroku
heroku login

# Create app
heroku create your-game-name

# Deploy
git push heroku main

# View logs
heroku logs --tail
```

---

## Option 3: Deploy to Vercel + Separate Backend

If you want to host frontend and backend separately:

### Frontend to Vercel
```bash
# vercel.json in root
{
  "rewrites": [
    { "source": "/(.*)", "destination": "/index.html" }
  ]
}
```

### Backend elsewhere (Railway, Heroku, etc.)

---

## Environment Variables (if needed)

Coming from Railway or Heroku dashboard:
- PORT (auto-set, defaults to 3001)
- NODE_ENV (set to "production" automatically)

---

## Testing Deployment

1. **Visit the URL** and check if game loads
2. **Check server logs** for any errors
3. **Test multiplayer** by opening 2 instances
4. **Share the link** with friends!

---

## Troubleshooting

### 404 Error
- Make sure all files were pushed to GitHub
- Check that index.html is in root directory

### Multiplayer not working
- Verify SERVER_URL in main.js matches deployment URL
- Check server logs in Railway/Heroku dashboard
- Ensure Socket.io is not blocked by firewall

### Game loads slowly
- Clear browser cache
- Check your internet speed
- Try a different device

---

## Support

Having issues? Check:
- Browser console (F12) for errors
- Railway/Heroku logs for backend errors
- GitHub Issues in your repository
