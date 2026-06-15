{ config, ... } : 
{
  lsp.servers = {
    gopls.enable = true;
  };
  treesitter.grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
    go
  ];
}
