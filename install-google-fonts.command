#!/bin/bash

echo "Installing Google Fonts..."

# Create the Fonts folder if it doesn't exist
mkdir -p ~/Library/Fonts

# Clone Google Fonts repo (shallow clone)
if [ ! -d ~/Library/Fonts/google-fonts ]; then
    git clone --depth 1 https://github.com/google/fonts.git ~/Library/Fonts/google-fonts
    echo "✅ Google Fonts successfully installed."
else
    echo "ℹ️ Google Fonts repo already exists. Skipping clone."
fi

# Create a launchd plist to auto-update weekly
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
        <string>$HOME/Library/Fonts/google-fonts</string>
        <string>pull</string>
    </array>
    <key>StartInterval</key>
    <integer>604800</integer> <!-- Once a week -->
    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>
EOF

launchctl load -w ~/Library/LaunchAgents/com.bento.googlefonts.update.plist

echo "✅ Automatic weekly update enabled via launchd."
echo "🎉 Done!"
