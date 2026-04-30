{ pkgs }:

let
  webkitBackport =
    import
      (builtins.fetchTarball {
        url = "https://github.com/NixOS/nixpkgs/archive/e0f477a570df7375172a08ddb9199c90853c63f0.tar.gz";
        sha256 = "16yzagh9id7q8m5vq4qcwln9ag0x8cfqlzydzlqi3wysgsk1rz6v";
      })
      {
        system = pkgs.system;
      };
in

with pkgs;
[
  webkitBackport.webkitgtk_4_1
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
  pkg-config
  wrapGAppsHook3
]
