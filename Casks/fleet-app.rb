cask "fleet-app" do
  version "1.0.1"
  sha256 "ee283307867b210d866f28cb09f987048e2d6a3c083b4729df23d0d6d227cd31"

  url "https://github.com/DavidKras95/fleet/releases/download/v#{version}/Fleet-v#{version}.zip"
  name "Fleet"
  desc "Native macOS manager for parallel Claude Code agents, tmux-backed"
  homepage "https://github.com/DavidKras95/fleet"

  depends_on macos: ">= :sonoma"
  depends_on formula: "tmux"
  depends_on formula: "jq"

  app "Fleet.app"

  caveats <<~EOS
    Open Fleet once to finish setup. Requires the `claude` CLI on your PATH.
  EOS

  zap trash: [
    "~/.claude/hooks/agent-tmux-status.sh",
    "~/Library/Preferences/com.davidkr.fleet.plist",
  ]
end
