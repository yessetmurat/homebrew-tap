class Yabai < Formula
  desc "Tiling window manager for macOS (fork with focus fixes)"
  homepage "https://github.com/yessetmurat/yabai"
  url "https://github.com/yessetmurat/yabai/releases/download/v7.1.25-fork.2/yabai-v7.1.25.tar.gz"
  version "7.1.25-fork.2"
  sha256 "87a6753c861fc8966b704d846b99e75b14f6b81a6f64988b9f83ccab548b0b7d"
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
