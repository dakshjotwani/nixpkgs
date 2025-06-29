{
  lib,
  stdenv,
  fetchFromGitHub,
}:

stdenv.mkDerivation rec {
  pname = "sekirofpsunlock";
  version = "0.2.3";

  src = fetchFromGitHub {
    owner = "Lahvuun";
    repo = "sekirofpsunlock";
    rev = "v${version}";
    sha256 = "sha256-tdKm7VNlOQST2uIXTajD7BCbhLktNRysOuDSYd9ONEU=";
  };

  buildPhase = ''
    $CC -std=c17 -Wall -Wextra -Wpedantic \
      src/main.c \
      src/common.c \
      src/signals.c \
      src/sekiro.c \
      src/fps.c \
      src/resolution.c \
      -o sekirofpsunlock
  '';

  installPhase = ''
    mkdir -p $out/bin
    install -m755 sekirofpsunlock $out/bin/
  '';

  meta = with lib; {
    description = "FPS unlocker for Sekiro";
    homepage = "https://github.com/Lahvuun/sekirofpsunlock";
    license = licenses.mit;
    platforms = platforms.linux;
    maintainers = [ "dakshjotwani" ]; # TODO: Invalid need to fix
  };
}
