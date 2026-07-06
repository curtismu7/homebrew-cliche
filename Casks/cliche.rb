cask "cliche" do
  version "0.1.10"
  sha256 "64b11f46a0b58b8418b1107c6d6d7bdf8a58b5e07626d797fef40ea5b4a8513c"

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
