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
  version "0.1.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/MuteJester/Fernsicht/releases/download/cli/v0.1.1/fernsicht-darwin-arm64"
      sha256 "1115b4fc7ca8079abb031e39f4cb3e6b89394fe579b2908215cd46b99847a00a"
    end
    on_intel do
      url "https://github.com/MuteJester/Fernsicht/releases/download/cli/v0.1.1/fernsicht-darwin-amd64"
      sha256 "b76ef3ce97858b1b56097004996b84bbbccb78f2f62a87f4fa80fa0270841894"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MuteJester/Fernsicht/releases/download/cli/v0.1.1/fernsicht-linux-arm64"
      sha256 "2bef34625937312dbf5e038ff3526fded08a66f558e3aa8b52bf97de1c2b658e"
    end
    on_intel do
      url "https://github.com/MuteJester/Fernsicht/releases/download/cli/v0.1.1/fernsicht-linux-amd64"
      sha256 "364b93f03197f26776334335a9dc0ba3cdccdf4e31545def2c50672c5a767bdb"
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
