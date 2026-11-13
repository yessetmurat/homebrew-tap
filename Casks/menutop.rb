cask "menutop" do
  version "0.1.1"
  sha256 "40ac6959e27cb2aa9ddb7bda362b295fac802a17a9eddda817eba39fb6188bfc"

  url "https://github.com/yessetmurat/menutop/releases/download/v0.1.1/menutop-0.1.1.zip"
  name "Menutop"
  desc "Menu bar monitor for Apple Silicon CPU, GPU, memory, power and temperature"
  homepage "https://github.com/yessetmurat/menutop"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  app "Menutop.app"
end
