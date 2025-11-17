{
  trouble = {
    enable = true;
    settings = {
      auto_open = false;
    };
  };

  dropbar.enable = true;

  telescope = {
    enable = true;
    keymaps = {
      "<leader>fg" = "live_grep";
      "<leader>ff" = "find_files";
      "<leader>fb" = "buffers";
      "<leader>fx" = "treesitter";
    };
  };

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

  lsp-lines.enable = true;

  origami.enable = true;
  treesitter = {
    enable = true;
    folding = true;
    settings = {
      auto_install = true;
      highlight = {
        additional_vim_regex_highlighting = true;
        enable = true;
      };
      indent = {
        enable = true;
      };
    };
  };

  treesitter-context.enable = true;
  treesitter-textobjects.enable = true;

  orgmode.enable = true;

  blink-ripgrep.enable = true;
  blink-indent.enable = true;
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
