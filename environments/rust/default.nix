{
  plugins = import ./plugins.nix;
  extraConfigVim = ''
    augroup RustMapping
    autocmd FileType rust nnoremap <buffer> <CR> :w<CR>:!python %<CR>
    augroup END
  '';
  extraConfigLua = ''
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.rs",
      callback = function()
        vim.cmd("silent! %!rustfmt --emit=stdout")
      end,
    })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "rust",
      callback = function()
        vim.keymap.set('n', '<CR>', function()
          vim.cmd('w')  -- save file

          -- check for Cargo.toml in current or parent directories
          local cargo_toml = vim.fn.findfile("Cargo.toml", ".;")
          if cargo_toml ~= "" then
            -- Cargo project: run with cargo in a terminal split
            vim.cmd('vsplit | terminal cargo run')
          else
            -- Single file: compile and run
            local file = vim.fn.expand('%')
            local output = vim.fn.expand('%:r')
            vim.cmd('vsplit | terminal rustc ' .. file .. ' -o ' .. output .. ' && ./' .. output)
          end
        end, { buffer = true, noremap = true, silent = true })
      end,
    })
  '';
}
