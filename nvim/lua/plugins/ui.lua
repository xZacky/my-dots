return {
  -- bufferline
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    config = function()
      require("bufferline").setup {
        options = {
          style_preset = require("bufferline").style_preset.no_italic, -- do not use italic
          indicator = { style = "none" },
          diagnostics = "nvim_lsp",
          diagnostics_update_in_insert = false,
          show_buffer_close_icons = false,
          show_close_icon = false,
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "center",
              separator = true
            }
          },
          separator_style = "thin",
          sort_by = "insert_at_end"
        }
      }
    end
  },
  -- indent-blankline
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    config = function()
      require("ibl").setup {
        scope = {
          enabled = false
        },
        indent = {
          char = "▏"
        }
      }
    end
  },
  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",   -- show icons
      "linrongbin16/lsp-progress.nvim" -- LSP loading progress
    },
    opts = {
      options = {
        -- only show on current cursor window
        globalstatus = true,
        -- do not use separators for sections
        section_separators = {
          left = "",
          right = ""
        },
        -- do not use separators for components
        component_separators = {
          left = "",
          right = ""
        },
        theme = {
          normal = {
            a = { bg = "#7aa2f7", fg = "#16161e" },
            b = { bg = "#3b4261", fg = "#7aa2f7" },
            c = { bg = "#1f2335", fg = "#a9b1d6" }
          },
          insert = {
            a = { bg = "#9ece6a", fg = "#16161e" },
            b = { bg = "#3b4261", fg = "#9ece6a" }
          },
          command = {
            a = { bg = "#f7768e", fg = "#16161e" },
            b = { bg = "#3b4261", fg = "#f7768e" }
          },
          visual = {
            a = { bg = "#bb9af7", fg = "#16161e" },
            b = { bg = "#3b4261", fg = "#bb9af7" }
          },
          replace = {
            a = { bg = "#ff9e64", fg = "#16161e" },
            b = { bg = "#3b4261", fg = "#ff9e64" }
          },
          terminal = {
            a = { bg = "#73daca", fg = "#16161e" },
            b = { bg = "#3b4261", fg = "#73daca" }
          },
          inactive = {
            a = { bg = "#1f2335", fg = "#7aa2f7" },
            b = { bg = "#1f2335", fg = "#3b4261" },
            c = { bg = "#1f2335", fg = "#3b4261" }
          }
        }
      },
      sections = {
        -- customize the diagnostics part
        lualine_b = {
          {
            "diagnostics",
            symbols = {
              error = " ",
              warn = " ",
              info = " ",
              hint = " "
            }
          }
        },
        -- customize the file name part
        lualine_c = {
          {
            "filename",
            file_status = false,
            newfile_status = false,
            -- 0: just the filename
            -- 1: relative path
            -- 2: absolute path
            -- 3: absolute path, with tilde as the home directory
            -- 4: filename and parent directory, with tilde as the home directory
            path = 0,
            -- do not show symbols
            symbols = {
              modified = "",
              readonly = ""
            }
          }
        }
      }
    }
  },
  -- barbecue
  {
    "utilyre/barbecue.nvim",
    event = "VeryLazy",
    dependencies = {
      "SmiteshP/nvim-navic" -- code path
    },
    config = function()
      require("barbecue").setup {
        create_autocmd = false,
        theme = {
          normal = { fg = "#a9b1d6" },
          ellipsis = { fg = "#737aa2" },
          separator = { fg = "#737aa2" },
          modified = { fg = "#ff9e64" },
          dirname = { fg = "#737aa2" },
          basename = { fg = "#a9b1d6", bold = true },
          context = { fg = "#a9b1d6" }
        },
        kinds = false
      }
      vim.api.nvim_create_autocmd({
        "WinResized",
        "BufWinEnter",
        "CursorHold",
        "InsertLeave",
        -- include this if you have set `show_modified` to `true`
        "BufModifiedSet"
      }, {
        group = vim.api.nvim_create_augroup("barbecue.updater", {}),
        callback = function() require("barbecue.ui").update() end
      })
    end
  }
}
