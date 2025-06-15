{
  description = "My NixVim config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixvim.url = "github:nix-community/nixvim/nixos-25.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, nixvim, flake-utils, ... } : 
    flake-utils.lib.eachDefaultSystem (system: {
      nixosModules.default = { pkgs, ... }: {
        packages.default = nixvim.legacyPackages.${system}.makeNixvimWithModule {
          inherit pkgs;
          module = import ./configuration.nix;
        };
      };
    });
}

