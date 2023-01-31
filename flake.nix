{
  description = "grain-lang";

  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachSystem ["x86_64-linux"] (system: let
      pkgs = import nixpkgs {
        inherit system;
        config.allowBroken = true;
      };
      grain-lang = pkgs.callPackage ./grain-lang.nix {};
    in {
      devShell = import ./shell.nix {
        inherit pkgs;
      };
      defaultPackage = grain-lang;
      packages = flake-utils.lib.flattenTree {
        inherit grain-lang;
      };
    });
}
