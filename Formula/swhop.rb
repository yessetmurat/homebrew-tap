class Swhop < Formula
  desc "Light app launcher and calculator for macOS (Apple Silicon)"
  homepage "https://github.com/yessetmurat/swhop"
  url "https://github.com/yessetmurat/swhop/releases/download/v0.3.0/swhop-v0.3.0.tar.gz"
  version "0.3.0"
  sha256 "51f89433c4d008f019e3cfff7f98600ba1f4e56f9ad06cdb2ff5ca468cbf73eb"
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
