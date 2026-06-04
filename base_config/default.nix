{ pkgs, ... } : {
  plugins = import ./plugins.nix { inherit pkgs; };
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
    rose-pine = {
      enable = true;
      settings = {
        variant = "auto";
      };
    };
  };

  extraConfigLua = ''
    require("aerial").setup({})
  '';

  extraConfigLuaPre = ''
    local handle = io.popen([[
      gdbus call \
        --session \
        --dest org.freedesktop.portal.Desktop \
        --object-path /org/freedesktop/portal/desktop \
        --method org.freedesktop.portal.Settings.Read \
        org.freedesktop.appearance color-scheme
    ]])

    if handle then
      local result = handle:read("*a")
      handle:close()

      if result:match("uint32 2") then
        vim.o.background = "light"
      else
        vim.o.background = "dark"
      end
    end
  '';
}
