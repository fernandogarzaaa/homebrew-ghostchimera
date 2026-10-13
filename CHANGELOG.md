# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed
- Formula bumped to GHOST-Chimera v0.4.0-beta.1: installs the PyPI sdist
  `ghostchimera-0.4.0b1.tar.gz` (sha256 `8f4151ee4cf521fcce73e9a6ffc988fa8f9ae63199b023cb0b5e96035be4a738`)
  instead of the `v0.4.0-beta` GitHub tag tarball. Extras caveat now pins the
  installed version.

### Fixed
- Formula now installable in principle: `include Language::Python::Virtualenv`, `url` points at the real `v0.4.0-beta` tag with its SHA256, installs the tagged tarball (not the newest PyPI build), and optional extras are opt-in (documented in caveats) instead of being pulled from PyPI on every install. Not yet verified with `brew audit`/`brew install` on macOS.

### Added
- README note: install with `--HEAD` until GHOST-Chimera tags a release (stable sha256 is still a placeholder).
- CI workflow that syntax-checks the formula on pushes to main and pull requests.
- Dependabot config for GitHub Actions (weekly).
- SECURITY.md with private reporting contact.
- This changelog.
