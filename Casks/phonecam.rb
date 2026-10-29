cask "phonecam" do
  version "1.1.0"
  sha256 "57d9627e0b58b319cc89c828ad4b568e0e3efdb7b16a1231f85c05a7127e9e34"

  url "https://github.com/tensarflow/PhoneCam/releases/download/v#{version}/PhoneCam-#{version}.dmg"
  name "PhoneCam"
  desc "Use an Android phone as a plug-and-play USB webcam and microphone"
  homepage "https://github.com/tensarflow/PhoneCam"

  depends_on cask: "android-platform-tools"
  depends_on macos: :sonoma

  app "PhoneCam.app"

  uninstall quit: "com.arteq.PhoneCam"

  # Upgrades also run `uninstall`, so the microphone driver (installed by the app itself)
  # is only removed by `brew uninstall --zap`.
  zap delete: "/Library/Audio/Plug-Ins/HAL/PhoneCamMic.driver",
      trash:  [
        "~/Library/Logs/PhoneCam.log",
        "~/Library/Preferences/com.arteq.PhoneCam.plist",
      ]

  caveats <<~EOS
    Open PhoneCam from Applications, then allow its camera in
      System Settings > General > Login Items & Extensions > Camera Extensions.
    On the phone, turn on USB debugging and tap Allow when you plug it in:
      https://github.com/tensarflow/PhoneCam#3-set-up-the-phone
    For the microphone over Bluetooth, install the PhoneCam Mic app on the phone:
      https://github.com/tensarflow/PhoneCam/releases/latest
  EOS
end
