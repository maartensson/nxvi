{
  plugins = import ./plugins.nix;
  extraConfigVim = ''
    augroup FSharpMappings
    autocmd BufNewFile,BufRead *.fs,*.fsx,*.fsi set filetype=fsharp
    augroup END
  '';
} 
