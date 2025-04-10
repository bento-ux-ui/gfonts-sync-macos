#!/bin/bash

echo "Cloning Google Fonts (without activating)..."

# Destination
mkdir -p ~/Documents

# Clone, update or re-clone
if [ ! -d ~/Documents/GoogleFontsRepo ]; then
    git clone --depth 1 https://github.com/google/fonts.git ~/Documents/GoogleFontsRepo
    echo "✅ Fonts downloaded to ~/Documents/GoogleFontsRepo"
elif [ -d ~/Documents/GoogleFontsRepo/.git ]; then
    echo "🔄 Repo already exists. Updating..."
    git -C ~/Documents/GoogleFontsRepo pull
else
    echo "⚠️ Folder exists but is not a Git repo. Re-cloning..."
    rm -rf ~/Documents/GoogleFontsRepo
    git clone --depth 1 https://github.com/google/fonts.git ~/Documents/GoogleFontsRepo
    echo "✅ Fonts re-downloaded to ~/Documents/GoogleFontsRepo"
fi

# Create launchd plist for automatic weekly update
mkdir -p ~/Library/LaunchAgents
cat <<EOF > ~/Library/LaunchAgents/com.bento.googlefonts.update.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
  "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.bento.googlefonts.update</string>
    <key>ProgramArguments</key>
    <array>
        <string>/usr/bin/git</string>
        <string>-C</string>
        <string>$HOME/Documents/GoogleFontsRepo</string>
        <string>pull</string>
    </array>
    <key>StartInterval</key>
    <integer>604800</integer> <!-- Every week -->
    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>
EOF

launchctl load -w ~/Library/LaunchAgents/com.bento.googlefonts.update.plist

# Open Font Book
echo "📖 Opening Font Book..."
open -a "Font Book"

# Display help message
osascript -e 'display dialog "Google Fonts have been downloaded.\n\nTo use them, open Font Book and:\n• Create a new Library (e.g. Google Fonts)\n• Drag and drop fonts from the folder:\n~/Documents/GoogleFontsRepo\n\nThis lets you activate only the fonts you need.\n\nAutomatic weekly update is already set up for you." buttons {"OK"} default button "OK"'

echo "🎉 Done!"
