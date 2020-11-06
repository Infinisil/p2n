let
  pkgs = import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/29b450fd8bc9b3d60c2410772e61da94cc080bd4.tar.gz";
    sha256 = "12i3926j2387ch8nna77af4jw3kri1rkc2d3m2y54vmcjryrsjs7";
  }) {};
  poetry2nix = import (fetchTarball {
    url = "https://github.com/nix-community/poetry2nix/archive/9cc728836f3ff1dbdb79edc85308cbeaf1313815.tar.gz";
    sha256 = "0s8k8rw2whvnyci8vbc3lfmqfzxvb5827y2imy7ibw5l0gp7pm95";
  }) {
    pkgs = pkgs;
    poetry = pkgs.poetry;
  };
in poetry2nix.mkPoetryEnv {
  projectDir = ./.;
}
