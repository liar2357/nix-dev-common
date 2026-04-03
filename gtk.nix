{ pkgs }:
with pkgs;
[
  gtk4
  gtk4-layer-shell
  pkg-config
  gobject-introspection
  glib
  libxml2
  vscode-langservers-extracted
  nodePackages.prettier
]
