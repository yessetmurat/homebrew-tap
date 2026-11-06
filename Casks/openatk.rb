cask "openatk" do
  version "0.1.0"
  sha256 "c58f29d563387ab1c8b45bc8c9def9ed8c19b75e98a0d5820970bfc9050b9b7a"

  url "https://github.com/yessetmurat/openatk/releases/download/v0.1.0/openatk-0.1.0.zip"
  name "openatk"
  desc "Light native settings app for ATK mice"
  homepage "https://github.com/yessetmurat/openatk"

  depends_on macos: ">= :sequoia"

  app "openatk.app"

  zap trash: "~/Library/Preferences/app.openatk.plist"
end
