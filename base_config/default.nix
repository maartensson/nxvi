{ pkgs, ... } : {
  plugins = import ./plugins.nix;
  keymaps = import ./keymaps.nix;

  extraPlugins = with pkgs.vimPlugins; [ 
    lazygit-nvim
    aerial-nvim
  ];


  viAlias = true;
  vimAlias = true;

  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };

  opts = {
    updatetime = 100;

    conceallevel=2;
    concealcursor="nc";

    incsearch = true;

    ignorecase = true;
    smartcase = true;
    undofile = true;
    swapfile = false;

    number = true;
    relativenumber = true;
    shiftwidth = 2;

    clipboard = "unnamedplus";

    foldmethod = "expr";
    foldexpr = "nvim_treesitter#foldexpr()";
    foldtext = "v:lua.vim.treesitter.foldtext()";
    foldlevel = 99;
    foldlevelstart = 99;
  };

  opts.completeopt = ["menu" "menuone" "noselect"];


  colorschemes = {
    catppuccin = {
      enable = true;
      settings = {
        flavor = "mocha";
      };
    };
  };

  extraConfigLua = ''
    require("aerial").setup({})
  '';
}
