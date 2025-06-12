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
