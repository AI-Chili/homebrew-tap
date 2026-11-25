class Aichili < Formula
  desc "Official CLI and MCP server for AI Chili cinematic AI video generation"
  homepage "https://aichili.ai/developers"
  url "https://github.com/AI-Chili/aichili/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "42412cd8f995e7031e6a4e94170e7cff8259eb36046ff4071aa60b41749e09d8"
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
    assert_match "1.0.1", shell_output("#{bin}/aichili --version")
    out = shell_output("#{bin}/aichili estimate --seconds 15 --resolution 768p --json")
    assert_match "\"totalCredits\": 15", out
  end
end
