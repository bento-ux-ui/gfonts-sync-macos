#!/bin/bash

echo "Uninstalling Google Fonts..."

# Stop auto-update if it's still loaded
launchctl unload ~/Library/LaunchAgents/com.bento.googlefonts.update.plist 2>/dev/null
rm -f ~/Library/LaunchAgents/com.bento.googlefonts.update.plist

# Remove fonts folder
rm -rf ~/Library/Fonts/google-fonts

echo "✅ Google Fonts and auto-update have been removed from your system."
