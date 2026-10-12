# Ghost Chimera Homebrew tap

Ships `brew install ghostchimera` without waiting on Homebrew core.

## Create the tap (one time, ~5 minutes)

```bash
# 1. New public repo: github.com/fernandogarzaaa/homebrew-ghostchimera
gh repo create fernandogarzaaa/homebrew-ghostchimera --public \
  --description "Homebrew tap for Ghost Chimera"

# 2. Copy the formula in (from a tagged GHOST-Chimera checkout):
cp homebrew/ghostchimera.rb /tmp/tap/Formula/ghostchimera.rb
cd /tmp/tap && git add . && git commit -m "ghostchimera 0.4.0" && git push -u origin main
```

## Install (users)

```bash
brew tap fernandogarzaaa/ghostchimera
brew install ghostchimera
ghostchimera doctor
```

> **Status:** the formula points at the `v0.4.0-beta` source tag of GHOST-Chimera
> with its real SHA256 and installs the core runtime into a private virtualenv
> (core Python dependencies are fetched from PyPI during install). It has not yet
> been run through `brew audit` / `brew install` on macOS by CI, so treat it as
> beta. `brew install --HEAD ghostchimera` tracks `main`.

## Per release

1. Tag `vX.Y.Z` in GHOST-Chimera.
2. Update `url` + `sha256` in `Formula/ghostchimera.rb`
   (`shasum -a 256 vX.Y.Z.tar.gz` from the release page).
3. `brew audit --new ghostchimera && brew test ghostchimera`, then push.

Optional extras are not installed by default (they can be very large: torch,
CUDA, GUI and voice stacks). Add one into the formula's isolated venv, e.g.
`$(brew --prefix)/opt/ghostchimera/libexec/bin/python -m pip install "ghostchimera[mcp] @ https://github.com/fernandogarzaaa/GHOST-Chimera/archive/refs/tags/v0.4.0-beta.tar.gz"`
Install extras from the same tag, not plain `ghostchimera[mcp]`, which would pull
the PyPI build over it (`brew info ghostchimera` shows the exact command).
