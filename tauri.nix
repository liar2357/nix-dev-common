{ pkgs }:

let
  oldPkgs =
    import
      (builtins.fetchTarball {
        url = "https://github.com/NixOS/nixpkgs/archive/nixos-25.05.tar.gz";
        sha256 = "sha256-F8WmEwFoHsnix7rt290R0rFXNJiMbClMZyIC/e+HYf0=";
      })
      {
        system = pkgs.system;
      };
in

with pkgs;
[
  oldPkgs.webkitgtk_4_0 # ← ここが核心
  gtk3
  glib
  oldPkgs.libsoup_2_4 # ← これもセット

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
