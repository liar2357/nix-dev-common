{ pkgs }:
with pkgs;
[
  # 🔥 ここが重要
  webkitgtk_4_1
  gtk3
  glib
  gobject-introspection
  libsoup_3
  openssl

  # ビルド補助
  cmake
  ninja

  # よく忘れるやつ
  dbus
]
