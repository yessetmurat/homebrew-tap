class Swhop < Formula
  desc "Light app launcher and calculator for macOS (Apple Silicon)"
  homepage "https://github.com/yessetmurat/swhop"
  url "https://github.com/yessetmurat/swhop/releases/download/v0.5.1/swhop-v0.5.1.tar.gz"
  version "0.5.1"
  sha256 "9a88bd4a5dec845bb009bc88b56a9f724344b1a9669abe4973f27cc13574d750"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "bin/swhop"
  end

  service do
    run [opt_bin/"swhop"]
    keep_alive crashed: true
    process_type :interactive
    log_path var/"log/swhop.log"
    error_log_path var/"log/swhop.log"
  end

  def caveats
    <<~EOS
      Start swhop now and at login:
        brew services start swhop
      Turn off other cmd+space shortcuts first (Spotlight, Alfred).
      Settings are read from ~/.config/swhop/swhop.toml.
    EOS
  end

  test do
    assert_match "usage: swhop", shell_output("#{bin}/swhop --bad 2>&1", 2)
  end
end
