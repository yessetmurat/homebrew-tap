class Rhop < Formula
  desc "Light app launcher and calculator for macOS (Apple Silicon)"
  homepage "https://github.com/yessetmurat/rhop"
  url "https://github.com/yessetmurat/rhop/releases/download/v0.1.0/rhop-v0.1.0.tar.gz"
  version "0.1.0"
  sha256 "2dff6eaab9cc86b176a5874b55c041304f30df0e71ba9fd3836d5973ae48f712"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "bin/rhop"
  end

  def caveats
    <<~EOS
      Start it at login:
        rhop --start-service
      Turn off other cmd+space shortcuts first (Spotlight, Alfred).
    EOS
  end

  test do
    assert_match "usage: rhop", shell_output("#{bin}/rhop --bad 2>&1", 2)
  end
end
