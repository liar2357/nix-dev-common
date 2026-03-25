{ pkgs }:
with pkgs;
[
  nodejs_25
  pnpm_10
  typescript-language-server
  vscode-langservers-extracted
  nodePackages.prettier
]
