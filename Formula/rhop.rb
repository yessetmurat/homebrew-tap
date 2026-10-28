class Rhop < Formula
  desc "Light app launcher and calculator for macOS (Apple Silicon)"
  homepage "https://github.com/yessetmurat/rhop"
  url "https://github.com/yessetmurat/rhop/releases/download/v0.2.2/rhop-v0.2.2.tar.gz"
  version "0.2.2"
  sha256 "8e8da46b3e233c4e4f518756139e729b8b30940e6bd6a6bd3bdd4ab0d4edaa98"
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
