{ config, ... } : 
{
  plugins = import ./plugins.nix { inherit config; }; 
}
