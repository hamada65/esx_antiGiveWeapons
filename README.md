## 🛡️ esx_antiGiveWeapons

**🔫 Anti-Weapon Spawn System for ESX Framework | By Zahya Dev**  
Detects and blocks illegitimate client-side weapon spawns using secure server-side checks with webhook logging and optional ban/kick functionality.

> ⚠️ Inspired by: [Saq69/Saq-AntiWeapons](https://github.com/Saq69/Saq-AntiWeapons/tree/main)

---

### 📦 Features

- ✅ Prevents players from spawning weapons via cheats or executors
- 🔒 Validates all newly received weapons with `xPlayer.hasWeapon()`
- 📬 Sends only newly added weapons to the server (low usage)
- 🕵️ Automatic Discord logs via customizable webhook
- 🚫 Bans or kicks players who try to give themselves illegal weapons
- ⚙️ Supports **old and new ESX frameworks**
- 🔁 Configurable check interval (default: every 10 seconds)

---

### 📁 Folder Structure

```
esx_antiGiveWeapons/
├── client/
│   └── client.lua
├── server/
│   └── server.lua
├── config.lua
├── config_webhook.lua
└── fxmanifest.lua
```

---

### 🚀 Installation

1. **Download or clone this repository** into your `resources` folder:
   ```bash
   git clone https://github.com/yourname/esx_antiGiveWeapons.git
   ```

2. **Add to your `server.cfg`:**
   ```cfg
   ensure esx_antiGiveWeapons
   ```

3. **Edit `config_webhook.lua` and insert your webhook URL:**
   ```lua
   Webhooks = {
       url = "https://discord.com/api/webhooks/your_webhook_url_here",
   }
   ```

---

### ⚙️ Configuration

Edit `config.lua` to customize options:

```lua
Config = {}

Config.FrameWork = {
    old = false, -- true = legacy ESX using 'esx:getSharedObject', false = export-based
    sharedObject = "esx:getSharedObject", -- only used if old = true
}

Config.WhitelistedWeapons = {
    ["WEAPON_PETROLCAN"] = true, -- allowed even if player doesn't "own" it
}

Config.checkInterval = 10 -- time in seconds between weapon scans
```

---

### 🛠️ How It Works

- **Client** checks all ESX-defined weapons in your loadout.
- If a weapon appears that wasn't already known, it's sent to the server.
- **Server** checks if the player actually owns the weapon.
- If not:
  - It sends a Discord log.
  - Then calls `banPlayer()` or your own custom logic (you can modify this).

---

### 🧱 Requirements

- ESX Legacy or Extended (`es_extended`)
- Valid Discord Webhook
- Optional ban/kick system (edit `banPlayer()`)

---

### 📜 License

This resource is open-source and free to use or modify.  
You must give credit if used publicly.

---

### 🙏 Credits

- 💡 **Inspired by:** [Saq-AntiWeapons](https://github.com/Saq69/Saq-AntiWeapons/tree/main)
- 🛠️ **Developer:** Zahya Dev  
  📌 Discord: [Zahya Dev Community](https://discord.gg/mp6krbdyAN)
