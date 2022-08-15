{ stdenv
, lib
, libogg_src
}:

stdenv.mkDerivation {
  pname = "libogg";
  version = "1.3.5";

  src = libogg_src;

  nativeBuildInputs = [
  ];
}
