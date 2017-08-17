class Googler < Formula
  desc "Google Search and News from the command-line"
  homepage "https://github.com/jarun/googler"
  url "https://github.com/jarun/googler/archive/v3.3.tar.gz"
  sha256 "c9e259067b49554705837258bf4856b7608eb17478e989d8d19f2d31b4b6d355"
  head "https://github.com/jarun/googler.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "2415b3d0efc35366382b8caae255f8a9c262616f4d90962f789123149cef48d2" => :sierra
    sha256 "b05263a434a19da3e0e582a633a49bf49d2380bbf71b7b0a31fad07e0a62ca5d" => :el_capitan
    sha256 "b05263a434a19da3e0e582a633a49bf49d2380bbf71b7b0a31fad07e0a62ca5d" => :yosemite
  end

  depends_on :python3

  def install
    system "make", "disable-self-upgrade"
    system "make", "install", "PREFIX=#{prefix}"
    bash_completion.install "auto-completion/bash/googler-completion.bash"
    fish_completion.install "auto-completion/fish/googler.fish"
    zsh_completion.install "auto-completion/zsh/_googler"
  end

  test do
    ENV["PYTHONIOENCODING"] = "utf-8"
    assert_match "Homebrew", shell_output("#{bin}/googler --noprompt Homebrew")
  end
end
