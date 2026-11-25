class Aichili < Formula
  desc "Official CLI and MCP server for AI Chili cinematic AI video generation"
  homepage "https://aichili.ai/developers"
  url "https://github.com/AI-Chili/aichili/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "13b71c667f3584c7bbb95533edc3b58543ab9efab660e09b1993ad9b6bc9d33d"
  license "MIT"
  head "https://github.com/AI-Chili/aichili.git", branch: "main"

  depends_on "node"

  def install
    libexec.install "bin", "src", "package.json", "SKILL.md", "README.md", "LICENSE"
    chmod 0755, [libexec/"bin/aichili.mjs", libexec/"bin/aichili-mcp.mjs"]
    (bin/"aichili").write <<~EOS
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/bin/aichili.mjs" "$@"
    EOS
    (bin/"aichili-mcp").write <<~EOS
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/bin/aichili-mcp.mjs" "$@"
    EOS
  end

  test do
    assert_match "1.0.0", shell_output("#{bin}/aichili --version")
    out = shell_output("#{bin}/aichili estimate --seconds 15 --resolution 768p --json")
    assert_match "\"totalCredits\": 15", out
  end
end
