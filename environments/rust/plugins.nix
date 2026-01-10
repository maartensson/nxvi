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
      };
    };
  };

  treesitter.grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
    rust
  ];
}
