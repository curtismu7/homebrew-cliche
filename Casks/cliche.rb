cask "cliche" do
  version "0.1.16"
  sha256 "b1a437764fe7d21432fe532787308709f67df4944f9ece84ddcf138e7b13309e"

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
