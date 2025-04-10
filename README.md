
# Google Fonts Installer for macOS (Non-Intrusive + Auto-Update)

Easily download and keep Google Fonts updated on macOS — without activating them automatically and without needing Terminal.

## 🚀 Features
- Clones the full Google Fonts repository into `~/Documents/GoogleFontsRepo`
- Does **not activate** fonts — you stay in control
- Automatically updates fonts every week via `launchd`
- Requires no Terminal interaction — just double-click the `.command` script
- Opens Font Book with a helpful message

## 📦 How to use

1. Download and unzip the archive
2. Double-click `install-google-fonts-nonintrusive.command`
3. The script will:
   - Clone the [Google Fonts GitHub repo](https://github.com/google/fonts) into `~/Documents/GoogleFontsRepo`
   - Set up an automatic background update every 7 days
   - Open Font Book and prompt you to create a Library and import fonts manually

## 🔄 Fonts Location

All fonts are downloaded to:

```
~/Documents/GoogleFontsRepo
```

You can browse and import only the fonts you want using Font Book or a font manager.

## 🧼 Uninstall

Two `.command` scripts are also available for easy cleanup:

- `disable-sync.command` — disables the automatic weekly update
- `uninstall-google-fonts.command` — removes all downloaded fonts and disables the updater

### Manual Uninstall (if preferred)

To stop automatic updates:
```bash
launchctl unload ~/Library/LaunchAgents/com.bento.googlefonts.update.plist
rm ~/Library/LaunchAgents/com.bento.googlefonts.update.plist
```

To remove the fonts:
```bash
rm -rf ~/Documents/GoogleFontsRepo
```

## 🧠 Alternatives

Looking for a leaner or more curated setup?  
Check out [fnt](https://github.com/alexmyczko/fnt), a command-line tool to download only the fonts you want.

## 🪪 License

This project is licensed under the [MIT License](LICENSE).
