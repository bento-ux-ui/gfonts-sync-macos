#!/bin/bash

echo "Disabling automatic Google Fonts updates..."

launchctl unload ~/Library/LaunchAgents/com.bento.googlefonts.update.plist
rm -f ~/Library/LaunchAgents/com.bento.googlefonts.update.plist

echo "✅ Auto-update has been disabled."
