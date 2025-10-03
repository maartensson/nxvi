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
          vim.cmd('w')

          local cargo = vim.fn.findfile("Cargo.toml", ".;")
          if cargo ~= "" then
            vim.cmd('!' .. "cargo run")
          else
            local file = vim.fn.expand('%')
            local output = vim.fn.expand('%:r')
            vim.cmd('!' .. "rustc " .. file .. " -o " .. output .. " && ./" .. output)
          end
        end, { buffer = true, noremap = true, silent = false })
      end,
    })
  '';
}
