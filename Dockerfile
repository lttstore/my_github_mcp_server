FROM ghcr.io/sparfenyuk/mcp-proxy:latest

# 从官方镜像复制 github-mcp-server 二进制
COPY --from=ghcr.io/github/github-mcp-server:latest \
     /usr/local/bin/github-mcp-server \
     /usr/local/bin/github-mcp-server

EXPOSE 8080

ENTRYPOINT ["mcp-proxy", \
  "--host", "0.0.0.0", \
  "--port", "8080", \
  "--pass-environment", \
  "--allow-origin", "*", \
  "--", \
  "/usr/local/bin/github-mcp-server", "stdio"]