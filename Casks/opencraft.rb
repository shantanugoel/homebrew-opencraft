cask "opencraft" do
  version "0.2.0"
  sha256 "f8431873b8a304ab913030715b2ca6823375a5c7329c8584c53c75509051f6a3"

  url "https://github.com/shantanugoel/OpenCraft/releases/download/v#{version}/OpenCraft-#{version}-arm64.dmg"
  name "OpenCraft"
  desc "Operates the VSD StreamDock N4 Pro controller"
  homepage "https://github.com/shantanugoel/OpenCraft"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "OpenCraft.app"

  uninstall quit: "com.shantanugoel.opencraft"

  zap launchctl: "opencraft.login",
      trash:     [
        "~/Library/Application Support/OpenCraft",
        "~/Library/LaunchAgents/opencraft.login.plist",
        "~/Library/Preferences/com.shantanugoel.opencraft.plist",
      ]

  caveats <<~EOS
    Quit the vendor software VSD Craft before you start OpenCraft. Two
    applications must not operate one device at the same time.

    The actions "Send a hotkey", "Type text", and "Media key" need the
    Accessibility permission of macOS. OpenCraft shows a button to give it.
  EOS
end
