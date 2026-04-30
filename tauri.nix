{ pkgs }:
with pkgs;
[
  # WebKit
  webkitgtk_4_1
  gtk3
  glib
  libsoup_3

  # GPU / EGL（重要）
  mesa
  libGL
  libglvnd
  libEGL
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

  # その他
  openssl
  dbus
]
