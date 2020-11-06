let
  pkgs = import <nixpkgs> {};
  poetry2nix = import ~/src/poetry2nix {
    pkgs = pkgs;
    poetry = pkgs.poetry;
  };
in pkgs.mkShell {
  buildInputs = [
    (poetry2nix.mkPoetryEnv {
      projectDir = ./.;
    })
  ];
}
