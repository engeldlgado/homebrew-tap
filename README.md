# ToshLLM Homebrew tap

Install [ToshLLM](https://github.com/engeldlgado/toshllm) — run large language
models locally on Intel Macs with AMD GPUs — with Homebrew.

```bash
brew install --cask engeldlgado/tap/toshllm
```

> The casks go live with ToshLLM 0.86.5, the first release signed with an Apple
> Developer ID. They are ready on the `prepare-0.86.5` branch, waiting only for
> that release's checksum.

## Which one to install

The engine is compiled twice, because Macs whose CPU predates AVX2 (Mac Pro 5,1
and other pre-2013 Xeons) crash on launch with the normal build.

| your Mac | cask |
|---|---|
| any Intel Mac from 2013 on | `engeldlgado/tap/toshllm` |
| pre-2013 Xeon, no AVX2 | `engeldlgado/tap/toshllm-noavx2` |

To check, run `sysctl -n machdep.cpu.features | grep -c AVX2`. A `1` means the
normal cask; a `0` means the no-AVX2 one.

## Updates

ToshLLM updates itself, so `brew upgrade` leaves it alone. Use the app's own
updater, or `brew upgrade --cask --greedy toshllm` to force Homebrew to do it.

## Uninstall

```bash
brew uninstall --cask toshllm          # the app
brew uninstall --zap --cask toshllm    # and its settings and conversations
```

Neither touches downloaded models: those can be tens of gigabytes and live
wherever you pointed the app. Remove them by hand.
