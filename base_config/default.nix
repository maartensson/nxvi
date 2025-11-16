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

  colorschemes.github-theme = {
    enable = true;
  };

  opts.completeopt = ["menu" "menuone" "noselect"];

  extraConfigLua = ''
    require("aerial").setup({})
    vim.cmd('colorscheme github_light')
  '';
}
