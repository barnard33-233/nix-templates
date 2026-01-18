{
  description = "Kernel-FHS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }@args :
  flake-utils.lib.eachDefaultSystem (system:
  let
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

    fhs = pkgs.buildFHSEnv {
      name = "kernel-fhs";
      targetPkgs = pkgs: with pkgs; [
        binutils
        glibc.dev
        glibc.out

        gnumake
        ncurses
        bc
        flex
        bison
        elfutils.dev
        elfutils.out
        openssl.dev
        openssl.out
        pkg-config

        gcc
        gdb

        # llvmPackages.clang-unwrapped
        # llvmPackages.llvm
        # llvmPackages.lld
        # wllvm
      ];
      profile = ''
        export CPATH="/usr/include"
        export C_INCLUDE_PATH="/usr/include"
        export LIBRARY_PATH="/usr/lib"
      '';
    };
  in
  {
    devShells.default = fhs.env;
  });
}
