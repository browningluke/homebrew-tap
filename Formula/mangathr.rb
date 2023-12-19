class Mangathr < Formula
  desc "A terminal utility for downloading manga with support for MangaDex & Cubari."
  homepage "https://github.com/browningluke/mangathr"
  url "https://github.com/browningluke/mangathr.git",
    tag: "v2.2.0",
    revision: "a41ac08cc831245726570662f6537fc8f83e3974"
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
