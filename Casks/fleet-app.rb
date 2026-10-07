cask "fleet-app" do
  version "1.0.0"
  sha256 "1b187f147bdfea745435eccf7f09911351c7eff4c9768cb7bbbc2d0cd0b39874"

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
