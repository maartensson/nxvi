{ pkgs, ... } : {
  plugins = import ./plugins.nix;

  extraPlugins = with pkgs.vimPlugins; [ 
    vim-go 
  ];

  extraConfigLua = ''
    -- Go indentation
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "go",
      callback = function()
        vim.opt_local.expandtab = false
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
      end,
    })
  '';

  extraConfigVim = ''
    augroup GolangMappings
    autocmd FileType go nnoremap <buffer> <CR>r :w<CR>:GoRun<CR>
    autocmd FileType go nnoremap <buffer> <CR>t :w<CR>:GoTest<CR>
    autocmd FileType go nnoremap <buffer> <CR>c :w<CR>:GoCoverage<CR>
    autocmd FileType go nnoremap <buffer> <CR>gg :w<CR>:GoGenerate<CR>
    autocmd FileType go nnoremap <buffer> <leader>jj :w<CR>:GoAddTags<CR>
    autocmd FileType templ nnoremap <buffer> <CR> :w<CR>:!templ generate -f %<CR>
    augroup END
  '';
}
