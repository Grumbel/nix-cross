{ stdenv
, lib

, opus_src
, pkgconfig
}:

stdenv.mkDerivation {
  pname = "opus";
  version = "0.2";

  src = opus_src;

  enableParallelBuilding = true;

  configureFlags = [
  ];

  makeFlags = [
    "LDFLAGS=-lssp"
  ];

  nativeBuildInputs = [
    # pkgs.buildPackages.pkgconfig
    pkgconfig
  ];
}
