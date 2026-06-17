{ pkgs, config, ... } : {
  typescript-tools.enable = true;
  vim-css-color.enable = true;

  lsp = {
    servers = {
      html.enable = true;
      cssls.enable = true;
      ts_ls.enable = true;
      css_variables = {
        enable = true;
        package = pkgs.css-variables-language-server;
      };
    };
  };


  treesitter.grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
      html
      css
  ];
}
