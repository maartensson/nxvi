{
  plugins = import ./plugins.nix;
  extraConfigVim = ''
    augroup RustMapping
    autocmd FileType rust nnoremap <buffer> <CR> :w<CR>:!cargo run<CR>
    augroup END
  '';
  extraConfigLua = ''
  '';
}
