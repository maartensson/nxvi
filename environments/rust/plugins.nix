{
  rustaceanvim.enable = true;
  lsp = {
    enable = true;
    servers = {
      rust_analyzer = {
        enable = true;
        settings = {
          procMacro.enable = false;
        };
      };
    };
  };
}
