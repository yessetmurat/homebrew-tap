class Swwm < Formula
  desc "Tiling window manager and bar for macOS"
  homepage "https://github.com/yessetmurat/swwm"
  url "https://github.com/yessetmurat/swwm/releases/download/v0.1.0/swwm-0.1.0.tar.gz"
  version "0.1.0"
  sha256 "7d920e2f381faef68f0ca623c55341370138fe655f09bcab2a0820a34d4031df"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  def install
    bin.install "bin/swwm"
    (share/"swwm").install "share/swwm/fonts"
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
    EOS
  end

  test do
    assert_match "usage", shell_output("#{bin}/swwm --help 2>&1", 64)
  end
end
