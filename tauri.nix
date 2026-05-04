# tauri.nix
{ pkgs }:

with pkgs;
[
  # --- 必須コア ---
  pkg-config
  openssl

  # --- Tauri / WebKitGTK ---
  webkitgtk_4_1
  gtk3
  glib
  gobject-introspection
  libsoup_3
  librsvg

  # --- 描画まわり ---
  cairo
  gdk-pixbuf
  pango
  atk

  # --- X11系（Waylandでも保険で入れる） ---
  xorg.libX11
  xorg.libXcursor
  xorg.libXrandr
  xorg.libXi

  # --- GPU/OpenGL（ないとハマることある） ---
  libGL
  mesa

  # --- 開発補助 ---
  cargo-tauri

  # --- optional（デバッグ用） ---
  glib-networking
]
