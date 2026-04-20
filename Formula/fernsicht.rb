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
  version "0.1.2"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/MuteJester/Fernsicht/releases/download/cli/v0.1.2/fernsicht-darwin-arm64"
      sha256 "1032a6fa4469828601f89cf04891e8cc89b1bfabc15e130f04fb77ba85851f31"
    end
    on_intel do
      url "https://github.com/MuteJester/Fernsicht/releases/download/cli/v0.1.2/fernsicht-darwin-amd64"
      sha256 "a4bf759b935cbc1e4e04f8b997c3ccf6495f37ae2f712c0adc210a4e23aefe65"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MuteJester/Fernsicht/releases/download/cli/v0.1.2/fernsicht-linux-arm64"
      sha256 "ffcb2182c5b3c9b4e794eaada769543c456ddc97e8d6d015718f272418bd4dd7"
    end
    on_intel do
      url "https://github.com/MuteJester/Fernsicht/releases/download/cli/v0.1.2/fernsicht-linux-amd64"
      sha256 "8a15f0c4d6dde3e4ca46901e610c35a47bcae873dda615e81353555314a794ff"
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
