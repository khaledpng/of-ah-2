# اوف اح — Phaser 3 Multiplayer Game

A fast-paced Arabic platformer game built with Phaser 3 and Socket.io for real-time multiplayer gameplay.

## Features

- 🎮 Single-player platformer with multiple levels
- 👥 Real-time multiplayer lobby system (max 10 players)
- 📱 Fully responsive mobile UI
- 🐉 Boss battle with unique mechanics
- 🏆 Live leaderboard tracking
- 💬 Player name tags and status display

## Tech Stack

- **Frontend:** Phaser 3.70, HTML5, CSS3
- **Backend:** Node.js + Express, Socket.io 4.7.5
- **Hosting:** Railway

## Local Development

### Prerequisites
- Node.js 20+
- npm

### Setup

1. Clone the repository:
```bash
git clone https://github.com/yourusername/of-ah-2.git
cd of-ah-2
```

2. Install dependencies:
```bash
npm install
```

3. Start the server:
```bash
npm start
```

4. Open in browser:
```
http://localhost:3001
```

## Deployment to Railway

1. **Create a Railway account** at [railway.app](https://railway.app)

2. **Connect your GitHub repository:**
   - In Railway dashboard → New Project → GitHub Repo
   - Select this repository

3. **Set environment variables (if needed):**
   - Railway will auto-detect Node.js
   - Procfile will be used automatically

4. **Deploy:**
   - Each push to main will auto-deploy
   - Game will be live at your Railway URL

## Project Structure

```
of-ah-2/
├── index.html          # Main game HTML
├── main.js             # Phaser game + multiplayer logic
├── style.css           # Game UI styling
├── server.js           # Node.js WebSocket server
├── package.json        # Dependencies
├── Procfile            # Railroad deployment config
├── .nvmrc              # Node version (20)
├── .gitignore          # Git ignore rules
├── assets/             # Game images/sprites
└── README.md           # This file
```

## Game Controls

### Desktop
- Arrow Keys: Move
- Space: Jump
- S: Shoot (boss level)

### Mobile
- Virtual buttons on screen

## Multiplayer (🌐 اللعب الجماعي)

1. Click "🌐 اللعب الجماعي" from main menu
2. Enter your nickname (max 14 chars)
3. Either:
   - **Create Room:** Start a new lobby
   - **Join Room:** Enter 4-char code from friend
4. Click "جاهز ✓" when ready
5. Host clicks "ابدأ اللعبة ▶" to start

## Server Events

### Create/Join Lobbies
- `createLobby` → `lobbyCreated`
- `joinLobby` → `lobbyJoined`
- `playerJoined` (broadcast)

### Game State
- `setReady` → `readyChanged`
- `startGame` → `gameStarted`
- `playerUpdate` → `playerMoved` (broadcast)
- `playerDied` → `playerDied` (broadcast)
- `playerFinished` → `playerFinished` (broadcast)

## Troubleshooting

**Multiplayer not connecting?**
- Check if server is running
- Verify SERVER_URL in main.js matches your deployment
- Check browser console for connection errors

**Game runs slow on mobile?**
- Reduce graphical details
- Close other browser tabs
- Ensure good internet connection

## License

MIT License - Feel free to use and modify!

## Credits

Developed by the اوف اح team with Phaser 3
