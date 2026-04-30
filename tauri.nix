{ pkgs }:
with pkgs;
[
  gtk3
  glib
  libsoup_3

  # GPU
  mesa
  libGL
  libglvnd
  libgbm

  # Wayland
  wayland
  wayland-protocols
  libxkbcommon

  # X11 fallback
  xorg.libX11
  xorg.libXcursor
  xorg.libXrandr
  xorg.libXi

  openssl
  dbus
]

let
  webkitBackport = import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/e0f477a570df7375172a08ddb9199c90853c63f0.tar.gz";
  }) {};
in
[
  webkitBackport.webkitgtk_4_1
]
