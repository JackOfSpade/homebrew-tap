class Ccblocks < Formula
  desc "Time-shift Claude sessions to match your working hours"
  homepage "https://github.com/JackOfSpade/ccblocks"
  url "https://github.com/JackOfSpade/ccblocks/archive/refs/tags/v1.1.5.tar.gz"
  sha256 "3920a0b3e963a9fe2b4a32770b7345e67b3807328e2a46391c5936627bed453d"
  license "MIT"
  head "https://github.com/JackOfSpade/ccblocks.git", branch: "main"

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
