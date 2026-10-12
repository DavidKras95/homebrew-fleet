cask "fleet-app" do
  version "1.0.2"
  sha256 "fbb4d60f7378380a99efe0ea4a4a320d917e8f173b4d6617371260ffff1eb8c0"

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
