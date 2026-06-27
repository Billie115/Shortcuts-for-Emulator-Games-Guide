# GB / GBC / GBA / DS Game Shortcuts on PC
### Includes Icons + Pokémon Icon Pack

A quick guide on how to create desktop shortcuts for emulated titles, using Pokémon games as an example.

---

## Requirements
- A working emulator (e.g., mGBA, DeSmuME, melonDS)
- Your ROM files
- `.ico` icon files (see Icon Tutorial below)

---

## Included in This Repository

This repo comes with a **ready-to-use Pokémon icon pack** so you don't have to make them yourself!

| Included | Description |
|---|---|
| `.png` files | High quality Pokémon game cover/box art images |
| `.ico` files | Ready-to-use icons for Pokémon GB/GBC/GBA/DS titles |
| `convertToICO.ps1` | PowerShell script to convert your own PNGs to ICO |

> Just grab the `.ico` file for your game and skip straight to **Step 4**!

---

## Step 1 — Create a New Shortcut

Right-click on your **Desktop**, then select **New → Shortcut**. A window will pop up.

![Step 1 - Right Click Menu](/readmeImages/STEP_1_1.png)
![Step 1 - New Shortcut Window](/readmeImages/STEP_1_2.png)

---

## Step 2 — Set the Emulator + ROM Path

Find your **emulator executable** and **ROM file**. Then `Shift + Right Click` on each and select **"Copy as Path"**.

Paste them into the shortcut field like this:

```plaintext
"C:\PATH\TO\EMULATOR.exe" "C:\PATH\TO\YOUR\ROM.ext"
```

![Step 2 - Paste Path](/readmeImages/STEP_2_1.png)
![Step 2 - Result](/readmeImages/STEP_2_2.png)

---

## Step 3 — Name Your Shortcut

Type the desired name for your shortcut (e.g., `Pokémon FireRed`).

![Step 3 - Name Shortcut](/readmeImages/STEP_3.png)

---

## Step 4 — Set a Custom Icon

1. **Right-click** the shortcut → click **Properties**
2. Go to the **Shortcut** tab
3. Click **Change Icon...**
4. Hit **Browse** and select your `.ico` file

![Step 4 - Change Icon](/readmeImages/STEP_4.png)

---

## Icon Tutorial — Convert PNG to ICO

You can turn any image into an icon using the included `convertToICO.ps1` PowerShell script:

1. Place your `.png` image in the **same folder** as `convertToICO.ps1`
2. Right-click the script → **Run with PowerShell**
3. Your `.ico` file will be generated in the same folder

### Tips for Best Results

- **Best size:** `1024x1024` pixels
- **Add padding** between the edge and your image to avoid clipping
- Make sure the image has a **transparent background** for cleaner icons

### Useful Tools

| Tool | Link |
|---|---|
| Photopea (free online editor) | https://www.photopea.com/ |