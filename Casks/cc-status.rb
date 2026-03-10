cask "cc-status" do
  version "0.1.1"
  sha256 "ca3fe7f07a75f5c09d338e4aecb889a1512b67853b35b2e025a237d17ece7647"

  url "https://github.com/noellch/cc-status/releases/download/v#{version}/CCStatus-macos-arm64.zip"
  name "CC Status"
  desc "Menu bar app for monitoring Claude Code sessions"
  homepage "https://github.com/noellch/cc-status"

  depends_on macos: ">= :ventura"
  depends_on arch: :arm64

  app "CCStatus.app"
  binary "cc-status-hook"

  postflight do
    set_permissions "#{staged_path}/cc-status-hook", "+x"
  end

  uninstall quit: "com.crescendolab.cc-status"

  zap trash: [
    "~/.cc-status",
  ]
end
