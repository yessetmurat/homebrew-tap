class Swhop < Formula
  desc "Light app launcher and calculator for macOS (Apple Silicon)"
  homepage "https://github.com/yessetmurat/swhop"
  url "https://github.com/yessetmurat/swhop/releases/download/v0.3.1/swhop-v0.3.1.tar.gz"
  version "0.3.1"
  sha256 "a61c866b230b1c3e6692575efb2d483874848c4dedaf6abd48ad6314d68f1038"
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
