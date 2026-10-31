class Swhop < Formula
  desc "Light app launcher and calculator for macOS (Apple Silicon)"
  homepage "https://github.com/yessetmurat/swhop"
  url "https://github.com/yessetmurat/swhop/releases/download/v0.1.0/swhop-v0.1.0.tar.gz"
  version "0.1.0"
  sha256 "ab67d854aa399601683837bc6277e97efd481f0cdb1d73c6c160dc30a99e45f8"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "bin/swhop"
  end

  def caveats
    <<~EOS
      Start it at login:
        swhop --start-service
      Turn off other cmd+space shortcuts first (Spotlight, Alfred).
      App sources are read from ~/.config/swhop/apps.
    EOS
  end

  test do
    assert_match "usage: swhop", shell_output("#{bin}/swhop --bad 2>&1", 2)
  end
end
