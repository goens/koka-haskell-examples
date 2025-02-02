{pkgs ? import <nixpkgs> {}}:

pkgs.mkShell {
  buildInputs = [
    pkgs.koka
    pkgs.cabal-install
    pkgs.ghc
  ];
}
