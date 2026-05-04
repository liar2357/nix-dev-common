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

    in
    {
      devShells.${system} = {
        rust = pkgs.mkShell {
          buildInputs = import ./rust.nix { inherit pkgs; };

          shellHook = ''
            	    export RUST_BACKTRACE=1
            	  '';
        };

        web = pkgs.mkShell {
          buildInputs = import ./web.nix { inherit pkgs; };
        };

        rust_gtk_depnds = pkgs.mkShell {
          buildInputs = (import ./rust.nix { inherit pkgs; }) ++ (import ./gtk.nix { inherit pkgs; });

          shellHook = ''
            	    export RUST_BACKTRACE=1
            	  '';
        };

        tauri = pkgs.mkShell {
          buildInputs =
            (import ./web.nix { inherit pkgs; })
            ++ (import ./rust.nix { inherit pkgs; })
            ++ (import ./tauri.nix { inherit pkgs; });

          shellHook = ''
            export RUST_BACKTRACE=1
          '';
        };

      };
    };
}
