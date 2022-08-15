{ stdenv
, lib
, SDL2_src
}:

stdenv.mkDerivation {
  pname = "SDL2";
  version = "2.0.22";

  src = SDL2_src;

  installPhase = ''
    mkdir $out
    cp -vr ${stdenv.targetPlatform.config}/. $out/
    substituteInPlace $out/lib/pkgconfig/sdl2.pc \
      --replace "prefix=/opt/local/${stdenv.targetPlatform.config}" \
                "prefix=$out"
  '';
}
