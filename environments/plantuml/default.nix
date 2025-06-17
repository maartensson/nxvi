{
  plugins = import ./plugins.nix;
  extraConfigVim = ''
    augroup PlantUMLMappings
    autocmd FileType plantuml nnoremap <buffer> <CR>i :w<CR>:!plantuml %<CR>
    autocmd FileType plantuml nnoremap <buffer> <CR>di :w<CR>:!plantuml -darkmode %<CR>
    autocmd FileType plantuml nnoremap <buffer> <CR>p :w<CR>:!plantuml -tpdf %<CR>
    autocmd FileType plantuml nnoremap <buffer> <CR>dp :w<CR>:!plantuml -darkmode -tpdf %<CR>
    augroup END
  '';
}
