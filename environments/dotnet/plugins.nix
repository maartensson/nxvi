{ pkgs, ... } : {
  extraPlugins = with pkgs.vimPlugins; [ 
    nvim-treesitter-parsers.fsharp
  ];
  lsp = {
    servers = {
      fsautocomplete.enable = true;
      csharp-ls.enable = true;
    };
  };
}
