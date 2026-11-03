class Swwm < Formula
  desc "Tiling window manager and bar for macOS"
  homepage "https://github.com/yessetmurat/swwm"
  url "https://github.com/yessetmurat/swwm/releases/download/v0.3.1/swwm-0.3.1.tar.gz"
  sha256 "4141a168d8ab2f14c21c32c065a6ef93a77d57f732795aab29dcf9b6e954d30b"
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

      Optional Dock module: removes window shadows and keeps floating windows
      above tiled ones (needs SIP partly disabled):
        sudo swwm --install-dock-module
      Re-run it after upgrading swwm, then killall Dock.
    EOS
  end

  test do
    assert_match "usage", shell_output("#{bin}/swwm --help 2>&1", 64)
  end
end
