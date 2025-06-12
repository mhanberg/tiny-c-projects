{
  description = "Tiny C Projects";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {nixpkgs, ...}: let
    inherit (nixpkgs) lib;
    systems = [
      "aarch64-darwin"
      "x86_64-darwin"
      "x86_64-linux"
      "aarch64-linux"
    ];
    perSystem = func: lib.genAttrs systems (system: func {pkgs = nixpkgs.legacyPackages.${system};});
  in {
    packages = perSystem ({pkgs, ...}: let
      stdenv = pkgs.clangStdenv;
    in {
      greeting = stdenv.mkDerivation {
        name = "greeting";
        version = "0.1.0";
        src = ./.;
        buildPhase = ''
          clang -Wall -o greeting ./chapter2/greeting.c
        '';
        installPhase = ''
          mkdir -p $out/bin
          cp greeting $out/bin
        '';
      };
    });
    devShells = perSystem ({pkgs, ...}: {
      default = pkgs.mkShell {
        packages = with pkgs; [
          clang-tools
          clang
        ];
      };
    });
  };
}
