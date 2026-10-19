class Yabai < Formula
  desc "Tiling window manager for macOS (fork with focus fixes)"
  homepage "https://github.com/yessetmurat/yabai"
  url "https://github.com/yessetmurat/yabai/releases/download/v7.1.25-fork.1/yabai-v7.1.25.tar.gz"
  version "7.1.25-fork.1"
  sha256 "6d37d24659d01d36829fca6b5c492bb62a0b6c19578cd3775d7a94b527967eca"
  license "MIT"

  depends_on :macos

  def install
    bin.install "bin/yabai"
    man1.install "doc/yabai.1"
  end

  def caveats
    <<~EOS
      After every upgrade update the sudoers rule for `yabai --load-sa`,
      it pins the sha256 of the binary.
    EOS
  end

  test do
    assert_match "yabai-v", shell_output("#{bin}/yabai --version")
  end
end
