cask "cc-status" do
  version "0.1.3"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

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
