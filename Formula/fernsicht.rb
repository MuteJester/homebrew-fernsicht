# Homebrew formula template — rendered per release by
# .github/workflows/cli-release.yml and uploaded as `fernsicht.rb`.
# Maintainers copy it into the `MuteJester/homebrew-fernsicht` tap
# repo so users can install via:
#
#   brew install MuteJester/fernsicht/fernsicht
#
# Template placeholders are documented in dist-templates/README.md.

class Fernsicht < Formula
  desc "Watch any command's progress from anywhere — peer-to-peer via WebRTC"
  homepage "https://github.com/MuteJester/Fernsicht"
  version "0.1.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/MuteJester/Fernsicht/releases/download/cli/v0.1.0/fernsicht-darwin-arm64"
      sha256 "f4a42a9ba7113fe201ab3204a8cbbca487c5ec90adb013eb8bc4a023c6c8d2a2"
    end
    on_intel do
      url "https://github.com/MuteJester/Fernsicht/releases/download/cli/v0.1.0/fernsicht-darwin-amd64"
      sha256 "1f788e5b51a6234bc4e8414130367520950e9a6ea1073fb41731a5da0ff9b04e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MuteJester/Fernsicht/releases/download/cli/v0.1.0/fernsicht-linux-arm64"
      sha256 "7b712feb92ce47da67ae7463d5c63e21c7f1e1895d039890ffab8ba023f39db3"
    end
    on_intel do
      url "https://github.com/MuteJester/Fernsicht/releases/download/cli/v0.1.0/fernsicht-linux-amd64"
      sha256 "340a9babba86e2beb8302c27b6cbc701888abe4741a592f3d982acb2fa199552"
    end
  end

  def install
    # The downloaded file keeps its platform suffix; rename to
    # `fernsicht` on install so the user runs the unsuffixed binary.
    binary = Dir["fernsicht-*"].first
    raise "no fernsicht binary in download" if binary.nil?
    bin.install binary => "fernsicht"
  end

  test do
    # Smoke test: --version returns 0 and prints a sensible string.
    output = shell_output("#{bin}/fernsicht --version")
    assert_match "fernsicht #{version}", output
  end
end
