{ pkgs } : {
  #rustaceanvim.enable = true;
  lsp = {
    enable = true;
    servers = {
      rust_analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
        installRustfmt = true;
        onAttach.function = ''
          if client.server_capabilities.documentFormattingProvider then
              vim.api.nvim_clear_autocmds({ group = 0, buffer = bufnr })
              vim.api.nvim_create_autocmd("BufWritePre", {
                  group = vim.api.nvim_create_augroup("Format", { clear = true }),
                  buffer = bufnr,
                  callback = function()
                      vim.lsp.buf.format({ async = false })
                  end,
              })
          end
        '';
      };
    };
  };

  treesitter.grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
    rust
  ];
}
