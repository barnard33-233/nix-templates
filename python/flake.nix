{
  description = "Python venv.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils}:
  flake-utils.lib.eachDefaultSystem (system:
  let
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in
  {
    devShells.default = pkgs.mkShell {
      venvDir = ".venv";
      packages = with pkgs; [
        # 312 as default
        python312
        python312Packages.pip
        python312Packages.venvShellHook
        # python312Packages.matplotlib
      ];
    };
  });
}
