class Mangathr < Formula
  desc "Terminal utility for downloading manga with support for MangaDex & Cubari"
  homepage "https://github.com/browningluke/mangathr"
  url "https://github.com/browningluke/mangathr.git",
      tag:      "v2.3.1",
      revision: "e3046e7d6077acccac907f5b147f7bf8d19a6214"
  license "MIT"
  head "https://github.com/browningluke/mangathr.git", branch: "main"

  depends_on "git" => :build
  depends_on "go" => :build
  depends_on "make" => :build

  def install
    system "make"
    bin.install "bin/mangathr"

    generate_completions_from_executable(bin/"mangathr", "completion")
  end

  test do
    version_output = shell_output(bin/"mangathr version 2>&1")
    assert_match "v#{version}", version_output
  end
end
