class Rhop < Formula
  desc "Light app launcher and calculator for macOS (Apple Silicon)"
  homepage "https://github.com/yessetmurat/rhop"
  url "https://github.com/yessetmurat/rhop/releases/download/v0.2.0/rhop-v0.2.0.tar.gz"
  version "0.2.0"
  sha256 "bb0c1cbfafcaa31fb1c40cc1f080e7df8060dcbc290491cf3fafa75965943f04"
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
