cask "toshllm-noavx2" do
  version "0.87.33"
  sha256 "674093bbc600affe5679830cfd6e32817ac29691adbf21297d0285d3ccfda8af"

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
