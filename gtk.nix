{ pkgs }:
with pkgs;
[
  gtk4
  pkg-config
  gobject-introspection
  glib
  libxml2
  vscode-langservers-extracted
  nodePackages.prettier
]
