# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Fixed
- Formula now installable in principle: `include Language::Python::Virtualenv`, `url` points at the real `v0.4.0-beta` tag with its SHA256, installs the tagged tarball (not the newest PyPI build), and optional extras are opt-in (documented in caveats) instead of being pulled from PyPI on every install. Not yet verified with `brew audit`/`brew install` on macOS.

### Added
- README note: install with `--HEAD` until GHOST-Chimera tags a release (stable sha256 is still a placeholder).
- CI workflow that syntax-checks the formula on pushes to main and pull requests.
- Dependabot config for GitHub Actions (weekly).
- SECURITY.md with private reporting contact.
- This changelog.
