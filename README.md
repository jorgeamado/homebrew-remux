# homebrew-remux

Homebrew tap for [**remux**](https://github.com/jorgeamado/remux) — your
persistent tmux session, on your phone.

## Install

```sh
brew tap jorgeamado/remux
brew install remux
```

This pulls a prebuilt binary (macOS arm64/x86_64, Linux arm64/x86_64) from the
[remux releases](https://github.com/jorgeamado/remux/releases) and installs
`tmux` as a dependency. After installing:

```sh
remux serve --listen <tailscale-ip>:7777
```

It prints a single-use pairing QR/link for your phone. See the
[remux README](https://github.com/jorgeamado/remux#readme) for TLS setup (via
`tailscale cert`, required to install the PWA on iOS) and the full options.

## Upgrading

```sh
brew update
brew upgrade remux
```

## What's here

- [`Formula/remux.rb`](Formula/remux.rb) — the formula. It is generated and
  filled in (version + per-platform SHA256s) by the remux release workflow on
  each tagged release; don't hand-edit it here.

## Notes

- The formula installs a released binary, not a source build — no Rust
  toolchain needed.
- Every release artifact carries sigstore build provenance; verify a download
  with `gh attestation verify <file> --repo jorgeamado/remux`.
