{ stdenv
, lib
, SDL2_image_src
}:

stdenv.mkDerivation rec {
  pname = "SDL2";
  version = "2.0.22";

  src = SDL2_image_src;

  installPhase = ''
    mkdir $out
    cp -vr ${stdenv.targetPlatform.config}/. $out/
    substituteInPlace $out/lib/pkgconfig/SDL2_image.pc \
      --replace "prefix=/opt/local/${stdenv.targetPlatform.config}" \
                "prefix=$out"
  '';
}
