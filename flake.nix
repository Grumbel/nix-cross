{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";
    flake-utils.url = "github:numtide/flake-utils";

    tinycmmc.url = "github:grumbel/tinycmmc";
    tinycmmc.inputs.nixpkgs.follows = "nixpkgs";
    tinycmmc.inputs.flake-utils.follows = "flake-utils";

    SDL2_src.url = "https://libsdl.org/release/SDL2-devel-2.0.22-mingw.tar.gz";
    SDL2_src.flake = false;

    SDL2_image_src.url = "https://www.libsdl.org/projects/SDL_image/release/SDL2_image-devel-2.0.5-mingw.tar.gz";
    SDL2_image_src.flake = false;

    openal-soft_src.url = "github:kcat/openal-soft?ref=1.22.2";
    openal-soft_src.flake = false;

    libmodplug_src.url = "https://downloads.sourceforge.net/project/modplug-xmms/libmodplug/0.8.9.0/libmodplug-0.8.9.0.tar.gz";
    libmodplug_src.flake = false;

    libogg_src.url = "https://downloads.xiph.org/releases/ogg/libogg-1.3.5.tar.gz";
    libogg_src.flake = false;

    libvorbis_src.url = "https://downloads.xiph.org/releases/vorbis/libvorbis-1.3.7.tar.xz";
    libvorbis_src.flake = false;

    opus_src.url = "https://archive.mozilla.org/pub/opus/opus-1.3.1.tar.gz";
    opus_src.flake = false;

    opusfile_src.url = "https://downloads.xiph.org/releases/opus/opusfile-0.12.tar.gz";
    opusfile_src.flake = false;

    mpg123_src.url = "https://downloads.sourceforge.net/project/mpg123/mpg123/1.30.2/mpg123-1.30.2.tar.bz2";
    mpg123_src.flake = false;
  };

  outputs = { self,
              nixpkgs, flake-utils,
              tinycmmc,
              SDL2_src,
              SDL2_image_src,
              libmodplug_src,
              libogg_src,
              libvorbis_src,
              mpg123_src,
              openal-soft_src,
              opus_src,
              opusfile_src,
            }:
    tinycmmc.lib.eachSystemWithPkgs (pkgs:
      {
        packages = rec {
          SDL2 = pkgs.callPackage ./pkgs/SDL2 { inherit SDL2_src; };

          SDL2_image = pkgs.callPackage ./pkgs/SDL2_image { inherit SDL2_image_src; };

          libmodplug = pkgs.callPackage ./pkgs/libmodplug { inherit libmodplug_src; };

          libogg = pkgs.callPackage ./pkgs/libogg { inherit libogg_src; };

          libvorbis = pkgs.callPackage ./pkgs/libvorbis { inherit libvorbis_src libogg; };

          mpg123 = pkgs.callPackage ./pkgs/mpg123 { inherit mpg123_src; };

          openal-soft = pkgs.callPackage ./pkgs/openal-soft { inherit openal-soft_src; };

          opus = pkgs.callPackage ./pkgs/opus { inherit opus_src; };

          opusfile = pkgs.callPackage ./pkgs/opusfile { inherit opusfile_src libogg opus; };
        };
      }
    );
}
