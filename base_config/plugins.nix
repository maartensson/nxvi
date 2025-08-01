{
  trouble = {
    enable = true;
    settings = {
      auto_open = false;
    };
  };

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

  treesitter.enable = true;

  treesitter-context.enable = true;

  blink-ripgrep.enable = true;
  blink-cmp-dictionary.enable = true;
  blink-cmp-copilot.enable = true;
  blink-cmp-spell.enable = true;
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
        providers = {
          spell = {
            module = "blink-cmp-spell";
            name = "Spell";
            score_offset = 100;
            opts = {
            };
          };
          copilot = {
            async = true;
            module = "blink-cmp-copilot";
            name = "copilot";
            score_offset = 100;
          };
          dictionary = {
            module = "blink-cmp-dictionary";
            name = "Dict";
            score_offset = 100;
            min_keyword_length = 3;
            # Optional configurations
            opts = {
            };
          };
          ripgrep = {
            async = true;
            module = "blink-ripgrep";
            name = "Ripgrep";
            score_offset = 100;
            opts = {
              prefix_min_len = 3;
              context_size = 5;
              max_filesize = "1M";
              project_root_marker = ".git";
              project_root_fallback = true;
              search_casing = "--ignore-case";
              additional_rg_options = {};
              fallback_to_regex_highlighting = true;
              ignore_paths = {};
              additional_paths = {};
              debug = false;
            };
          };
        };
        default = [
          "lsp"
          "path"
          "snippets"
          "buffer"
          "ripgrep"
          "dictionary"
          "copilot"
          "spell"
        ];
      };
    };
  };
}
