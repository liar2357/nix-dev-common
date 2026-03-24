{
description = "Common dev environments for Rust/GTK4/Node";

inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs   = import nixpkgs { inherit system; };
  in {
    devShells.${system} = {
      rust  = pkgs.mkShell {
	buildInputs = (import ./rust.nix { inherit pkgs; });
      };

      gtk   = pkgs.mkShell {
	buildInputs = (import ./gtk.nix { inherit pkgs; });
      };

      node  = pkgs.mkShell {
	buildInputs = (import ./node.nix { inherit pkgs; });
      };

      full  = pkgs.mkShell {
	buildInputs = (import ./rust.nix { inherit pkgs; }) 
		    ++ (import ./gtk.nix { inherit pkgs; })
		    ++ (import ./node.nix { inherit pkgs; });
      };
    };
  };
}
