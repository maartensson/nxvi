{ config, ... } : {
  plugins = import ./plugins.nix { inherit config; } ;
  extraConfigVim = ''
    augroup RustMapping
    autocmd FileType rust nnoremap <buffer> <CR> :w<CR>:!cargo run<CR>
    augroup END
  '';
  extraConfigLua = ''
  '';
}
