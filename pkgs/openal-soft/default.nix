{ stdenv
, lib
, openal-soft_src
, cmake
}:

stdenv.mkDerivation {
  pname = "openal-soft";
  version = "1.22.2";

  src = openal-soft_src;

  nativeBuildInputs = [
    # pkgs.buildPackages.cmake
    cmake
  ];
}
