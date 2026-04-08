FROM ghcr.io/sparfenyuk/mcp-proxy:latest

COPY --from=ghcr.io/github/github-mcp-server:latest \
     /server/github-mcp-server \
     /usr/local/bin/github-mcp-server

RUN chmod +x /usr/local/bin/github-mcp-server

EXPOSE 8080

ENTRYPOINT ["mcp-proxy", \
  "--host", "0.0.0.0", \
  "--port", "8080", \
  "--pass-environment", \
  "--allow-origin", "*", \
  "--", \
  "/usr/local/bin/github-mcp-server", "stdio"]