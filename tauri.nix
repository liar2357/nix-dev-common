{ pkgs }:
with pkgs;
[
  webkitgtk_4_1
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
