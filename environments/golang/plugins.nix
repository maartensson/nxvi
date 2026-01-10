{ pkgs } : {
  lsp.servers = {
    gopls.enable = true;
    templ.enable = true;
  };
  treesitter.grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
    go
    templ
  ];
}
