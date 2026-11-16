cask "menutop" do
  version "0.1.3"
  sha256 "6083418d2eb17228a9752d9c01f06f7d6dfdceb4db31598b5001f2ec1171a316"

  url "https://github.com/yessetmurat/menutop/releases/download/v0.1.3/menutop-0.1.3.zip"
  name "Menutop"
  desc "Menu bar monitor for Apple Silicon CPU, GPU, memory, power and temperature"
  homepage "https://github.com/yessetmurat/menutop"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  app "Menutop.app"
end
