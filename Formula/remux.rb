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
      sha256 "f3aa66be205d7cb1a952145ff29cd8260421a049fb3c58157b921a19b4f982e8"
    else
      url "https://github.com/jorgeamado/remux/releases/download/v0.2.0/remux-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "ba43a67699ac71881745978e4a886b80ef50573f1962761f0ebc9c3306d0385d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jorgeamado/remux/releases/download/v0.2.0/remux-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "561fbc78e9b6c9580606b96f67559ed5caa42149b1f36d118c4e3e275dd7318b"
    else
      url "https://github.com/jorgeamado/remux/releases/download/v0.2.0/remux-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1eefa5cbc8bac8e9ccb9ec9f7482c73e165fe2ecaa7c3456a9e523de2112891a"
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
