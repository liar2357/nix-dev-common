{
  description = "Common dev environments";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs =
    {
      self,
      nixpkgs,
      rust-overlay,
    }:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          rust-overlay.overlays.default
        ];
      };

      rustDeps = import ./rust.nix { inherit pkgs; };
      webDeps = import ./web.nix { inherit pkgs; };
      gtkDeps = import ./gtk.nix { inherit pkgs; };
      tauriDeps = import ./tauri.nix { inherit pkgs; };

      tauriDepsAll = webDeps ++ rustDeps ++ tauriDeps;

    in
    {
      devShells.${system} = {

        rust = pkgs.mkShell {
          buildInputs = rustDeps;
        };

        web = pkgs.mkShell {
          buildInputs = webDeps;
        };

        rust_gtk = pkgs.mkShell {
          buildInputs = rustDeps ++ gtkDeps;
        };

        tauri = pkgs.mkShell {
          buildInputs = tauriDepsAll;

          shellHook = ''
            export RUST_BACKTRACE=full
          '';
        };

        tauri-fhs = pkgs.buildFHSEnv {
          name = "tauri-fhs";

          targetPkgs = pkgs: tauriDepsAll;

          multiPkgs =
            pkgs: with pkgs; [
              zlib
              libGL
              libxkbcommon
              libxcb
              libX11
              libXcursor
              libXi
              libXrandr
              libXinerama
              libXext
            ];

          runScript = "bash";

          profile = ''
            export RUST_BACKTRACE=full

            export PKG_CONFIG_PATH="${pkgs.gtk3.dev}/lib/pkgconfig:${pkgs.gtk3.dev}/share/pkgconfig:${pkgs.gtk4.dev}/lib/pkgconfig:$PKG_CONFIG_PATH"
          '';
        };

      };
    };
}
