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
    foldlevel = 20;
    foldlevelstart = 20;
  };

  colorschemes.dracula.enable = true;

  opts.completeopt = ["menu" "menuone" "noselect"];

  extraConfigLua = ''
    require("aerial").setup({
    on_attach = function(bufnr)
    vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
    end,
    })
    vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
  '';
}
