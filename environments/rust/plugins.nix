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
              print("rust-analyzer attached to buffer " .. bufnr)

              vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                callback = function ()
                  print("Formatting Rust Buffer", .. bufnr)
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
