# Homebrew formula for Ghost Chimera (tap distribution).
#
# Upstream Homebrew core admission is out of scope; ship via a tap:
#   brew tap fernandogarzaaa/ghostchimera
#   brew install ghostchimera
# See README.md for the tap setup.
#
# Maintainer release checklist:
#   1. Tag vX.Y.Z on GitHub (a plain tag does not trigger the PyPI publish;
#      only a published GitHub Release does).
#   2. Update url + sha256 below (`curl -sL <url> | shasum -a 256`).
#   3. `brew audit --new ghostchimera` and `brew test ghostchimera` before tap push.
class Ghostchimera < Formula
  include Language::Python::Virtualenv

  desc "Background AI infrastructure: ambient intelligence runtime for AI agents"
  homepage "https://github.com/fernandogarzaaa/GHOST-Chimera"
  url "https://github.com/fernandogarzaaa/GHOST-Chimera/archive/refs/tags/v0.4.0-beta.tar.gz"
  sha256 "555a9760ebf26d7ef128b89b60e5342b63b5db4c2b1b66112990edf5dd9cee37"
  license "MIT"
  head "https://github.com/fernandogarzaaa/GHOST-Chimera.git", branch: "main"

  depends_on "python@3.12"

  def install
    # Installs the tagged source tarball (not whatever is newest on PyPI).
    # There are no `resource` blocks yet, so pip resolves the five small core
    # runtime dependencies (certifi, croniter, cryptography, jsonschema,
    # websockets) from PyPI during install.
    venv = virtualenv_create(libexec, "python3.12", without_pip: false)
    system venv.root/"bin/python", "-m", "pip", "install", "--no-cache-dir", buildpath
    %w[ghostchimera ghost chimera-pilot].each do |cmd|
      bin.install_symlink libexec/"bin"/cmd
    end
  end

  def caveats
    <<~EOS
      Only the core runtime is installed. Optional backends (desktop, mcp,
      gateway, local, quantum, minimind, voice) are opt-in, e.g.:
        #{opt_libexec}/bin/python -m pip install "ghostchimera[mcp] @ #{stable.url}"
    EOS
  end

  test do
    system bin/"ghostchimera", "doctor"
  end
end
