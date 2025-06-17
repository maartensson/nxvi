{
  haskell-scope-highlighting.enable = true;
  lsp = {
    enable = true;
    servers = {
      hls = {
        enable = true;
        installGhc = true;
      };
    };
  };
}
