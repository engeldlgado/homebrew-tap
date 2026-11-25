cask "toshllm" do
  version "0.88.1"
  sha256 "1f23c70f05038d0eba6a8c5a75fa120a2e0214af3ae4b1b90ae3dfc7a78a6470"

  url "https://github.com/engeldlgado/toshllm/releases/download/v#{version}/ToshLLM-v#{version}.dmg"
  name "ToshLLM"
  desc "Run large language models locally on Intel Macs with AMD GPUs"
  homepage "https://toshllm.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app checks for its own updates and installs them in place.
  auto_updates true
  depends_on arch: :x86_64
  depends_on macos: :sonoma

  app "ToshLLM.app"

  zap trash: [
    "~/Library/Application Support/ToshLLM",
    "~/Library/Caches/dev.engel.toshllm",
    "~/Library/HTTPStorages/dev.engel.toshllm",
    "~/Library/Preferences/dev.engel.toshllm.plist",
    "~/Library/Saved Application State/dev.engel.toshllm.savedState",
  ]

  caveats <<~EOS
    This build needs a CPU with AVX2 (Intel Macs from 2013 on). If ToshLLM quits
    on launch with "illegal hardware instruction", install the other build:
      brew uninstall --cask toshllm
      brew install --cask engeldlgado/tap/toshllm-noavx2

    Downloaded models are left in place; remove them by hand if you no longer
    want them.
  EOS
end
