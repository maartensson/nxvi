{
  description = "nixvim custom config";

  inputs = {
    nixvim.url = "github:nix-community/nixvim";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {self, nixvim, flake-utils, ...}:
  flake-utils.lib.eachDefaultSystem (system: {
    packages.default = nixvim.legacyPackages.${system}.makeNixvimWithModule {
      inherit system;
      module = ./config;
    };

    apps.default = {
      type = "app";
      program = "${self.packages.${system}.default}/bin/nvim";
    };
  }) // {
    nixosModules.default = {config, lib, pkgs, ...}: {
      options.programs.mvim = {
        enable = lib.mkEnableOption "Enable nixvim editor";
      };

      environment.systemPackages = lib.mkIf config.programs.mvim.enable [
	  self.packages.${pkgs.system}.default
      ];
    };
  };
}

