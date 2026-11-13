cask "menutop" do
  version "0.1.2"
  sha256 "7f5d16ec0519ea1bb38cc72d94aebdc047dc703868deb482ad0188bb57de5923"

  url "https://github.com/yessetmurat/menutop/releases/download/v0.1.2/menutop-0.1.2.zip"
  name "Menutop"
  desc "Menu bar monitor for Apple Silicon CPU, GPU, memory, power and temperature"
  homepage "https://github.com/yessetmurat/menutop"

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  app "Menutop.app"
end
