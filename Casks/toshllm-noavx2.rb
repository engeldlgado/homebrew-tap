cask "toshllm-noavx2" do
  version "0.87.19"
  sha256 "79af6ac6fddb8baa5b2d210edf8ce9bcf657be1c8eea0a767b043ee519532861"

  url "https://github.com/engeldlgado/toshllm/releases/download/v#{version}/ToshLLM-v#{version}-noavx2.dmg"
  name "ToshLLM (no-AVX2)"
  desc "ToshLLM build for Macs whose CPU predates AVX2"
  homepage "https://toshllm.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app checks for its own updates and installs them in place.
  auto_updates true
  conflicts_with cask: "toshllm"
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
    Downloaded models are left in place; remove them by hand if you no longer
    want them.
  EOS
end
