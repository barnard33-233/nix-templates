{
  description = "FHS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }@args :
  flake-utils.lib.eachDefaultSystem (system:
  let
    pkgs = import nixpkgs {
      inherit system;
      # config.allowUnfree = true;
    };

    fhs = pkgs.buildFHSEnv {
      name = "kernel-fhs";
      targetPkgs = pkgs: with pkgs; [
        hello
      ];
      profile = '''';
    };
  in
  {
    devShells.default = fhs.env;
  });
}
