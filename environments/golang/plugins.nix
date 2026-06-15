{ pkgs } : {
  lsp.servers = {
    gopls.enable = true;
  };
  treesitter.grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
    go
  ];
}
