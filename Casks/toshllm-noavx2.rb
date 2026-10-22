cask "toshllm-noavx2" do
  version "0.87.29"
  sha256 "4f9fd6922c2b42f77545e5b6391094216e715ba7fbc5d67adbdfff2edb4edc4f"

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
    Downloaded models are left in place; remove them by hand if you no longer
    want them.
  EOS
end
