cask "phonecam" do
  version "1.0.0"
  sha256 "01ede9e1d09a3e713a5980cb2fc4e62da67c754e8180221ffbe1ef8d49a7bc74"

  url "https://github.com/tensarflow/PhoneCam/releases/download/v#{version}/PhoneCam-#{version}.dmg"
  name "PhoneCam"
  desc "Use an Android phone as a plug-and-play USB webcam and microphone"
  homepage "https://github.com/tensarflow/PhoneCam"

  depends_on cask: "android-platform-tools"
  depends_on macos: :sonoma

  app "PhoneCam.app"

  uninstall quit:   "com.arteq.PhoneCam",
            delete: "/Library/Audio/Plug-Ins/HAL/PhoneCamMic.driver"

  zap trash: [
    "~/Library/Logs/PhoneCam.log",
    "~/Library/Preferences/com.arteq.PhoneCam.plist",
  ]

  caveats <<~EOS
    Open PhoneCam from Applications, then allow its camera in
      System Settings > General > Login Items & Extensions > Camera Extensions.
    On the phone, turn on USB debugging and tap Allow when you plug it in:
      https://github.com/tensarflow/PhoneCam#3-set-up-the-phone
  EOS
end
