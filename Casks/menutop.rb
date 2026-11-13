cask "menutop" do
  version "0.1.0"
  sha256 "6fb50c2b45d7a6751e8e90ea4c84d40409b97d1da84045a1b5160e7f18bfd402"

  url "https://github.com/yessetmurat/menutop/releases/download/v0.1.0/menutop-0.1.0.zip"
  name "Menutop"
  desc "Menu bar monitor for Apple Silicon CPU, GPU, memory, power and temperature"
  homepage "https://github.com/yessetmurat/menutop"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  app "Menutop.app"
end
