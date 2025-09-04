{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }@args :
  flake-utils.lib.eachDefaultSystem (system: 
  let
    pkgs = import nixpkgs { inherit system; };
  in
  {
    devShells.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        (texlive.combine {
          inherit (texlive) scheme-small
          latexmk
          ;
        })
      ];
    };
  });
}
