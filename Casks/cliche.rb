cask "cliche" do
  version "0.1.7"
  sha256 "76bd06285b914b24feded4acfd7ffacb978c69e7563a7a12752530e06663594a"

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
