{ stdenv
, lib
, libogg
, libvorbis_src
}:

stdenv.mkDerivation {
  pname = "libvorbis";
  version = "1.3.7";

  src = libvorbis_src;

  nativeBuildInputs = [
  ];

  buildInputs = [
    libogg
  ];
}
