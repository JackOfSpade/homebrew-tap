class Ccblocks < Formula
  desc "Time-shift Claude sessions to match your working hours"
  homepage "https://github.com/JackOfSpade/ccblocks"
  license "MIT"

  # No tagged release yet - build straight off this fork's master until a
  # v* tag exists. Install with: brew install --HEAD jackofspade/tap/ccblocks
  head "https://github.com/JackOfSpade/ccblocks.git", branch: "master"

  depends_on "bash"
  depends_on macos: :catalina

  def install
    libexec.install Dir["libexec/*"]
    libexec.install "VERSION"
    prefix.install "LICENSE", "README.md", "CONTRIBUTING.md"
    bin.write_exec_script libexec/"ccblocks"
  end

  def caveats
    <<~EOS
      To get started:
        ccblocks setup
    EOS
  end

  def uninstall
    system bin/"ccblocks", "uninstall", "--force"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ccblocks --version")
  end
end
