{stdenv, ...}:
stdenv.mkDerivation {
  name = "greeting";
  version = "0.1.0";
  src = ./.;
  buildPhase = ''
    clang -Wall -o greeting main.c
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp greeting $out/bin
  '';
}
