{
  pkgs,
  zig,
  ...
}:
pkgs.stdenv.mkDerivation {
  name = "chapter2";
  version = "0.1.0";
  src = ./.;
  nativeBuildInputs = [
    zig.hook
    pkgs.zig_0_14
  ];
}
