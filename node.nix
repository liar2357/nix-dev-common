{ pkgs }:
with pkgs; [
  nodejs_25
  pnpm_10
  typescript-language-server
  nodePackages.prettier
]
