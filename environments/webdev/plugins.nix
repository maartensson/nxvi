{ config, ... } : {
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


  treesitter.grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
      html
      css
  ];
}
