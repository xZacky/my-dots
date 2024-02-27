-- ui
return {
  -- bufferline
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    config = function()
      require("bufferline").setup {
        options = {
          style_preset = require("bufferline").style_preset.no_italic, -- do not use italic
          indicator = {
            style = 'none'
          },
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
          separator_style = "thin"
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
      "nvim-tree/nvim-web-devicons", -- show icons
      "linrongbin16/lsp-progress.nvim", -- LSP loading progress
      "folke/tokyonight.nvim"
    },
    opts = {
      options = {
        theme = "tokyonight",
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
        -- only show on current cursor window
        globalstatus = true
      },
      sections = {
        -- customize the diagnostics part
        lualine_b = {
          {
            "diagnostics",
            symbols = {
              error = "󰯸 ",
              warn = "󰰮 ",
              info = "󰰄 ",
              hint = "󰰁 "
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
      "SmiteshP/nvim-navic", -- code path
      "folke/tokyonight.nvim"
    },
    opts = {
      theme = "tokyonight"
    }
  }
}
