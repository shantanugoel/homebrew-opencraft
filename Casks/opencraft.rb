cask "opencraft" do
  version "0.4.0"
  sha256 "6b4b9bec4ae49c5b55364b001b627b8b1dd553e0017f598cb843c1696b834922"

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
