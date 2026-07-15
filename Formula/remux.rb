# Homebrew formula for remux. Lives in the tap repository
# (github.com/jorgeamado/homebrew-remux as Formula/remux.rb); this copy is the
# template release CI fills in. Users then install with:
#
#   brew tap jorgeamado/remux
#   brew install remux
#
class Remux < Formula
  desc "Your persistent tmux session, on your phone"
  homepage "https://github.com/jorgeamado/remux"
  version "0.2.0"
  license "MIT"

  depends_on "tmux"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jorgeamado/remux/releases/download/v0.2.0/remux-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "153491facf3372b32566f1e8fdb3e7c58f69d1eb15419b62b0878e74e34ffa0f"
    else
      url "https://github.com/jorgeamado/remux/releases/download/v0.2.0/remux-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "cc47ba43154fd2e600cce621769a1759c3c66c35c1f21e25f42837046f59c41b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jorgeamado/remux/releases/download/v0.2.0/remux-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b768d27056262e598c6939e635aa0e497073fc293728d8f31e98701cc501923d"
    else
      url "https://github.com/jorgeamado/remux/releases/download/v0.2.0/remux-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3bc54887078e901931ee0e04f0265a7e9f9d411fb0e04a17db4382901adce09d"
    end
  end

  def install
    bin.install "remux"
  end

  def caveats
    <<~EOS
      Start the daemon on your tailnet interface (never a public one):
        remux serve --listen <tailscale-ip>:7777
      It prints a single-use pairing QR/link for your phone. See the README
      for TLS via `tailscale cert` (required to install the PWA on iOS).
    EOS
  end

  test do
    assert_match "remux", shell_output("#{bin}/remux --version")
  end
end
