class Rhop < Formula
  desc "Light app launcher and calculator for macOS (Apple Silicon)"
  homepage "https://github.com/yessetmurat/rhop"
  url "https://github.com/yessetmurat/rhop/releases/download/v0.2.1/rhop-v0.2.1.tar.gz"
  version "0.2.1"
  sha256 "ce516560db7621d04de108c08f744c0b335ff8b268e3f8cb9d0cfe460ec3b49a"
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
