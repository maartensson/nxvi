{
  plugins = import ./plugins.nix;
  extraConfigVim = ''
    augroup PythonMapping
    autocmd FileType python nnoremap <buffer> <CR> :w<CR>:!python %<CR>
    augroup END
  '';
}
