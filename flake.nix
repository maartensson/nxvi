{
  description = "nixvim custom config";

  inputs = {
    nixvim.url = "github:nix-community/nixvim";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {self, nixvim, flake-utils, ...}:
  flake-utils.lib.eachDefaultSystem (system: {
    nixosModules.default = {config, lib, pkgs, ...}: {
      options.programs.mvim = {
        enable = lib.mkEnableOption "Enable nixvim editor";
        environments = {
          golang.enable = lib.mkEnableOption "Enable golang environment";
          rust.enable = lib.mkEnableOption "Enable rust environment";
          python.enable = lib.mkEnableOption "Enable python environment";
          kotlin.enable = lib.mkEnableOption "Enable kotlin environment";
          haskell.enable = lib.mkEnableOption "Enable haskell environment";
          web.enable = lib.mkEnableOption "Enable web dev environment";
          plantuml.enable = lib.mkEnableOption "Enable plantuml environment";
          java.enable = lib.mkEnableOption "Enable java environment";
          database.enable = lib.mkEnableOption "Enable database environment";
        };
      };

      config = lib.mkIf config.programs.mvim.enable {
        environment.systemPackages =  [
          (nixvim.legacyPackages.${system}.makeNixvimWithModule {
            inherit system;
            module = [
              ./base_config
            ]
            ++ lib.optional config.programs.mvim.environments.golang.enable ./environments/golang
            ++ lib.optional config.programs.mvim.environments.rust.enable ./environments/rust
            ++ lib.optional config.programs.mvim.environments.python.enable ./environments/python
            ++ lib.optional config.programs.mvim.environments.kotlin.enable ./environments/kotlin
            ++ lib.optional config.programs.mvim.environments.haskell.enable ./environments/haskell
            ++ lib.optional config.programs.mvim.environments.web.enable ./environments/webdev
            ++ lib.optional config.programs.mvim.environments.plantuml.enable ./environments/plantuml
            ++ lib.optional config.programs.mvim.environments.java.enable ./environments/java
            ++ lib.optional config.programs.mvim.environments.database.enable ./environments/database;
          })
        ];

        apps.default = {
          type = "app";
          program = "${self.packages.${system}.default}/bin/vi";
        };
      };
    };
  });
}

