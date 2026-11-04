class Swhop < Formula
  desc "Light app launcher and calculator for macOS (Apple Silicon)"
  homepage "https://github.com/yessetmurat/swhop"
  url "https://github.com/yessetmurat/swhop/releases/download/v0.5.0/swhop-v0.5.0.tar.gz"
  version "0.5.0"
  sha256 "9742512afeaa90bd46ad156e2d7f1816dc9c1bbb52a28245899084e7b990a394"
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
