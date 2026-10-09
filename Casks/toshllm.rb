cask "toshllm" do
  version "0.87.19"
  sha256 "c2cc476d490e5079831b2579ebcd524d0bfaaed9d638d9dd33704b42a04b0b10"

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
  depends_on macos: :sonoma
  depends_on arch: :x86_64

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
