{ pkgs }:
with pkgs;
[
  bun
  nodejs # fallback用（重要）
  typescript
  typescript-language-server
  vscode-langservers-extracted
  prettier
]
