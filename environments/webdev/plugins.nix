{ pkgs, ... } : {
  typescript-tools.enable = true;
  vim-css-colors.enable = true;

  lsp = {
    servers = {
      html.enable = true;
      htmx.enable = true;
      cssls.enable = true;
      ts_ls.enable = true;
      css_variables.enable = true;
    };
  };

  treesitter.grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      html
      css
      javascript
      typescript
  ];
}
