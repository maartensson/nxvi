{ pkgs, ... } : {
  extraPlugins = with pkgs.vimPlugins; [ 
    nvim-treesitter-parsers.fsharp
  ];

  plugins = import ./plugins.nix;

  extraConfigVim = ''
    augroup FSharpMappings
    autocmd BufNewFile,BufRead *.fs,*.fsx,*.fsi set filetype=fsharp
    augroup END
  '';
} 
