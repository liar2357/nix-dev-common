{ pkgs }:
with pkgs;
[
  # WebKit
  webkitgtk_4_1
  gtk3
  glib
  libsoup_3

  # 🔥 GPU周り
  mesa
  libGL
  libglvnd

  # 表示系
  xorg.libX11
  xorg.libXcursor
  xorg.libXrandr
  xorg.libXi

  # その他
  openssl
  dbus
]
