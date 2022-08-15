{ stdenv
, lib

, pkgconfig
, libogg
, opus
, opusfile_src
}:

stdenv.mkDerivation {
  pname = "opusfile";
  version = "0.12";

  src = opusfile_src;

  configureFlags = [
    "--disable-http"
  ];

  nativeBuildInputs = [
    # pkgs.buildPackages.pkgconfig
    pkgconfig
  ];

  buildInputs = [
    libogg
    opus
  ];
}
