{ stdenv
, lib
, mpg123_src
}:

stdenv.mkDerivation {
  pname = "mpg123";
  version = "1.30.2";

  src = mpg123_src;
}
