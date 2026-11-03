class Swwm < Formula
  desc "Tiling window manager and bar for macOS"
  homepage "https://github.com/yessetmurat/swwm"
  url "https://github.com/yessetmurat/swwm/releases/download/v0.2.0/swwm-0.2.0.tar.gz"
  sha256 "29d67b845769acc3503398372ac3829037a84ea07225dce82378bd855592a5e7"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  def install
    bin.install "bin/swwm"
    (share/"swwm").install Dir["share/swwm/*"]
  end

  service do
    run [opt_bin/"swwm"]
    keep_alive crashed: true
    process_type :interactive
    log_path var/"log/swwm.log"
    error_log_path var/"log/swwm.log"
  end

  def caveats
    <<~EOS
      Start swwm now and at login:
        brew services start swwm
      Then allow swwm in System Settings > Privacy & Security > Accessibility.

      Optional, removes window shadows (needs SIP partly disabled):
        sudo swwm --install-shadows
      Re-run it after upgrading swwm.
    EOS
  end

  test do
    assert_match "usage", shell_output("#{bin}/swwm --help 2>&1", 64)
  end
end
