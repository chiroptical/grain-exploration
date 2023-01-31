{pkgs, ...}: let
  grain-lang = pkgs.callPackage ./grain-lang.nix {};
  grain-lang-wrapper = pkgs.writeShellScriptBin "grain" ''
    ${grain-lang}/bin/grain $@
  '';
in
  pkgs.mkShell {
    buildInputs = with pkgs; [
      grain-lang-wrapper
      alejandra
    ];
  }
