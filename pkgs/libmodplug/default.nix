{ stdenv
, lib
, libmodplug_src
}:

stdenv.mkDerivation {
  pname = "libmodplug";
  version = "1.22.2";

  src = libmodplug_src;

  nativeBuildInputs = [
  ];
}
