{
  description = "nixvim custom config";

  inputs.nixvim.url = "github:nix-community/nixvim";

  outputs = { nixvim, ... }:
  {
    nixosModules.default = {config, lib, pkgs, ...}: {
      options.programs.nxvi = {
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
          dotnet.enable = lib.mkEnableOption "Enable dotnet environment";
        };
      };

      config = lib.mkIf config.programs.nxvi.enable {
        environment.systemPackages =  [
          (nixvim.legacyPackages.${ pkgs.stdenv.hostPlatform.system }.makeNixvimWithModule {
            inherit (pkgs) system;
            module = [
              ./base_config
            ]
            ++ lib.optional config.programs.nxvi.environments.golang.enable ./environments/golang
            ++ lib.optional config.programs.nxvi.environments.rust.enable ./environments/rust
            ++ lib.optional config.programs.nxvi.environments.python.enable ./environments/python
            ++ lib.optional config.programs.nxvi.environments.kotlin.enable ./environments/kotlin
            ++ lib.optional config.programs.nxvi.environments.haskell.enable ./environments/haskell
            ++ lib.optional config.programs.nxvi.environments.web.enable ./environments/webdev
            ++ lib.optional config.programs.nxvi.environments.plantuml.enable ./environments/plantuml
            ++ lib.optional config.programs.nxvi.environments.java.enable ./environments/java
            ++ lib.optional config.programs.nxvi.environments.database.enable ./environments/database
            ++ lib.optional config.programs.nxvi.environments.dotnet.enable ./environments/dotnet;
          })
        ];
      };
    };
  };
}

