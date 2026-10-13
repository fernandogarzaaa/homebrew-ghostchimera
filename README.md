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

> **Status:** the formula installs GHOST-Chimera **v0.4.0-beta.1** from its PyPI
> sdist (`ghostchimera-0.4.0b1.tar.gz`, SHA256 verified) into a private
> virtualenv; core Python dependencies are fetched from PyPI during install. It
> has not yet been run through `brew audit` / `brew install` on macOS by CI, so
> treat it as beta. `brew install --HEAD ghostchimera` tracks `main`.

## Per release

1. Publish the GitHub Release in GHOST-Chimera (its `publish.yml` uploads the
   sdist + wheel to PyPI).
2. Point `url` in `Formula/ghostchimera.rb` at the new PyPI sdist and update
   `sha256` (`curl -sL <url> | shasum -a 256`).
3. `brew audit --new ghostchimera && brew test ghostchimera`, then push.

Optional extras are not installed by default (they can be very large: torch,
CUDA, GUI and voice stacks). Add one into the formula's isolated venv, pinned to
the installed version so pip does not replace it, e.g.
`$(brew --prefix)/opt/ghostchimera/libexec/bin/python -m pip install "ghostchimera[mcp]==0.4.0b1"`
(`brew info ghostchimera` shows the exact command).
