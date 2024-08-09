class Mangathr < Formula
  desc "Terminal utility for downloading manga with support for MangaDex & Cubari"
  homepage "https://github.com/browningluke/mangathr"
  url "https://github.com/browningluke/mangathr.git",
      tag:      "v2.3.0",
      revision: "7eceb84c2090f9428d367cd4258278520d37f6a7"
  license "MIT"
  head "https://github.com/browningluke/mangathr.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", "bin/mangathr", "./cmd/mangathr"
    bin.install "bin/mangathr"

    generate_completions_from_executable(bin/"mangathr", "completion")
  end

  test do
    version_output = shell_output(bin/"mangathr version 2>&1")
    assert_match "v#{version}", version_output
  end
end
