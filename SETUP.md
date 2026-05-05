# Quick Setup for Railway & GitHub

## 📦 What's Included

Your "of ah 2" folder has everything needed:

```
✅ index.html              - Main game page
✅ main.js                 - Phaser game + multiplayer logic (163KB)
✅ style.css               - Game styling
✅ server.js               - Node.js WebSocket server
✅ package.json            - Dependencies (Socket.io)
✅ assets/                 - Game images/sprites
✅ Procfile                - Railway tells it to run: node server.js
✅ .nvmrc                  - Node version (20)
✅ .gitignore              - Don't upload node_modules
✅ README.md               - Full documentation
✅ DEPLOYMENT.md           - How to deploy
```

---

## 🚀 Upload to GitHub (3 steps)

### Step 1: Create repo on GitHub

1. Go to [GitHub.com](https://github.com)
2. Click **+ New Repository**
3. Name: `of-ah-2`
4. Click **Create repository**
5. DON'T click "Add README" (we have one)

### Step 2: Copy commands from GitHub

After creating, GitHub shows you commands. They look like:
```bash
git remote add origin https://github.com/YOUR_USERNAME/of-ah-2.git
git branch -M main
git push -u origin main
```

### Step 3: Run in Terminal

Open Terminal/VSCode and run:
```bash
cd "/Users/user/Desktop/of ah 2"
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/YOUR_USERNAME/of-ah-2.git
git branch -M main
git push -u origin main
```

Replace `YOUR_USERNAME` with your actual GitHub username!

---

## 🎮 Deploy to Railway (2 steps)

### Step 1: Connect GitHub to Railway
1. Go to [railway.app](https://railway.app)
2. Sign in (use GitHub to sign up)
3. Click **New Project** → **Deploy from GitHub repo**
4. Click **Connect GitHub**
5. Select `of-ah-2` repository

### Step 2: Wait & Get Link
- Railway auto-detects Node.js
- Builds and deploys automatically (~2-3 min)
- Your URL appears in Dashboard like: `https://of-ah-2.up.railway.app`

---

## ✅ Your Game Link

Once deployed to Railway:
```
https://YOUR-RAILWAY-DOMAIN.up.railway.app
```

Share this link with anyone to play!

---

## 🔧 To Fix Current Issue

The problem: Game isn't loading on Railway because either:

1. **Files weren't uploaded** → Do GitHub steps above
2. **Server isn't running** → Check Railway logs/dashboard
3. **PORT mismatch** → Make sure server uses `process.env.PORT || 3001`

Check that your `server.js` has this:
```js
const PORT = process.env.PORT || 3001;
server.listen(PORT, "0.0.0.0", () => console.log(`Server running on port ${PORT}`));
```

---

## 📱 Mobile Link

Once live, open on your phone:
- Desktop: `https://your-domain.up.railway.app`
- Mobile: Same link! (game auto-scales for mobile)

---

## 💬 Need Help?

Check logs in Railway dashboard → Logs tab to see any errors!
