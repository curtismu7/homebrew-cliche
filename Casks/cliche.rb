cask "cliche" do
  version "0.1.15"
  sha256 "5294fdb8d67c5422b33dc5cfb39f043314b07e4042184f88f5ee0090db9a1727"

  url "https://github.com/curtismu7/cliche/releases/download/v#{version}/Cliche-#{version}.zip"
  name "Cliché"
  desc "Clipboard history + screen capture and annotation for the menu bar"
  homepage "https://github.com/curtismu7/cliche"

  depends_on macos: :sonoma

  app "Cliché/Cliche.app"

  # Ad-hoc signed (no Apple Developer certificate); clear quarantine so
  # Gatekeeper allows launch without the right-click dance.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine",
                          "#{appdir}/Cliche.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Cliche",
  ]
end
