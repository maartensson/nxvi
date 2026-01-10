{ pkgs } : {
  # Diagnostic
  # https://github.com/folke/trouble.nvim/
  trouble = {
    enable = true;
    settings = {
      auto_open = false;
    };
  };

  # Drop down menu
  # https://github.com/Bekaboo/dropbar.nvim/
  dropbar.enable = true;

  # Search files or code with fzf
  # https://github.com/nvim-telescope/telescope.nvim
  telescope = {
    enable = true;
    keymaps = let 
      open_trouble = ''require("trouble.sources.telescope").open'';
    in {
      "<leader>fg" = "live_grep";
      "<leader>ff" = "find_files";
      "<leader>fb" = "buffers";
      "<leader>fx" = "treesitter";
      "<leader>p" = open_trouble;
    };
  };

  # Top bar showing open buffers
  # https://github.com/romgrk/barbar.nvim/
  barbar = {
    enable = true;
    keymaps = {
      next.key = "<TAB>";
      previous.key = "<S-TAB>";
      close.key = "<C-w>";
    };
  };

  web-devicons.enable = true;
  lspkind.enable = true;

  neo-tree.enable = true;
  nix.enable = true;

  markdown-preview.enable = true;
  lualine.enable = true;
  gitsigns.enable = true;
  nvim-autopairs.enable = true;
  vim-surround.enable = true;
  commentary.enable = true;

  lsp = {
    enable = true;
    keymaps = {
      silent = true;
      diagnostic = {
        "<leader>k" = "goto_prev";
        "<leader>j" = "goto_next";
      };
      lspBuf = {
        gd = "definition";
        gD = "references";
        gt = "type_definition";
        gi = "implementation";
        K = "hover";
        "<F2>" = "rename";
      };
    };
    servers = {
      bashls.enable = true;
      jsonls.enable = true;
      nil_ls.enable = true;
      marksman.enable = true;
    };
  };

  # folding
  origami.enable = true;

  treesitter = {
    enable = true;
    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      bash
      make
      json
      markdown
      nix
      regex
      toml
      xml
      yaml
    ];
  };

  blink-ripgrep.enable = true;
  blink-indent.enable = false;
  blink-cmp = {
    enable = true;
    settings = {
      completion = {
        documentation = {
          auto_show = true;
        };
        ghost_text = {
          enabled = true; # maybe disable menu ? 
        };
      };
      signature = {
        enabled = true;
      };
      keymap = {
        preset = "enter";
      };
      sources = {
        default = [
          "lsp"
          "path"
          "snippets"
          "buffer"
        ];
      };
    };
  };
}
