{
  pkgs,
  stdenv,
  ...
}: let
  grain-lang-src = pkgs.fetchurl {
    url = "https://github.com/grain-lang/grain/releases/download/grain-v0.5.13/grain-linux-x64";
    sha256 = "sha256-sP5bsL3EitiQYrSvRc2Up6b73BDqBxBszVhMazYTZQY";
  };
in
  stdenv.mkDerivation {
    name = "grain-lang";
    src = grain-lang-src;
    phases = ["installPhase"];
    installPhase = ''
      mkdir -p $out/bin
      cp $src $out/bin/grain
      chmod +x $out/bin/grain
    '';
  }
