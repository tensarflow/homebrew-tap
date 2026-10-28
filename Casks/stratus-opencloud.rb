cask "stratus-opencloud" do
  version "0.1.0"
  sha256 "d2d28cb109c9a6f55778ec8a2d516564e25963e548f18f4fba914fdc6b8af036"

  url "https://github.com/tensarflow/stratus-opencloud/releases/download/v#{version}/Stratus-#{version}.dmg"
  name "Stratus for OpenCloud"
  desc "On-demand Finder access to OpenCloud spaces"
  homepage "https://github.com/tensarflow/stratus-opencloud"

  depends_on macos: :sonoma

  app "Stratus.app"

  uninstall quit: "com.arteq.stratus"

  zap trash: [
    "~/Library/Containers/com.arteq.stratus",
    "~/Library/Containers/com.arteq.stratus.FileProvider",
    "~/Library/Group Containers/QBPWS3ADVD.com.arteq.stratus",
  ]

  caveats <<~EOS
    Open Stratus from Applications and sign in to your OpenCloud server.
    macOS adds the Finder location turned off; turn it on in
      System Settings > General > Login Items & Extensions > File Providers.
  EOS
end
