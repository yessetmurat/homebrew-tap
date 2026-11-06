cask "openatk" do
  version "0.1.1"
  sha256 "ae88ba4b1a44a627a4bd43ffd958f3656732e6428574d40ec14ea82797c69ad2"

  url "https://github.com/yessetmurat/openatk/releases/download/v0.1.1/openatk-0.1.1.zip"
  name "openatk"
  desc "Light native settings app for ATK mice"
  homepage "https://github.com/yessetmurat/openatk"

  depends_on macos: ">= :sequoia"

  app "openatk.app"

  zap trash: "~/Library/Preferences/app.openatk.plist"
end
