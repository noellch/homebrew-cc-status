cask "cc-status" do
  version "0.1.2"
  sha256 "943a05be94dbf1e7cd02ccf88cdecb5dcb7bc4f8c53ff48f04f5e426c9f2897f"

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
