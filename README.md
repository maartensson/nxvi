# My NixVim Configuration

## Installation

```nix
# flake.nix
{
  inputs.nxvi.url = "git+ssh://git@github.com/maartensson/nxvi";
  outputs = { nxvi, ... } : {
    nixosConfigurations.<name>.modules = [
      nxvi.nixosModules.default
      {
        programs.nxvi = {
          enable = true;
          environments = {
            golang.enable = true;
            rust.enable = true;
            python.enable = true;
            kotlin.enable = true;
            plantuml.enable = true;
            haskell.enable = true;
            java.enable = true;
            database.enable = true;
            dotnet.enable = true;
          };
        };
      }
    ];  
  };
}
```

