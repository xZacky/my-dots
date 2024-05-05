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
      "nvim-tree/nvim-web-devicons",    -- show icons
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
      "SmiteshP/nvim-navic" -- code path
    },
    opts = {
      theme = {
        normal = { fg = "#a9bed6" },
        ellipsis = { fg = "#737aa2" },
        separator = { fg = "#737aa2" },
        modified = { fg = "#ff9e64" },
        dirname = { fg = "#737aa2" },
        basename = { fg = "#a9bed6", bold = true },
        context = { fg = "#a9bed6" },
        context_file = { fg = "#a9bed6" },
        context_module = { fg = "#bb9af7" },
        context_namespace = { fg = "#bb9af7" },
        context_package = { fg = "#7dcfff" },
        context_class = { fg = "#73daca" },
        context_method = { fg = "#ff9e64" },
        context_property = { fg = "#7aa2f7" },
        context_field = { fg = "#7aa2f7" },
        context_constructor = { fg = "#73daca" },
        context_enum = { fg = "#73daca" },
        context_interface = { fg = "#ff9e64" },
        context_function = { fg = "#ff9e64" },
        context_variable = { fg = "#7dcfff" },
        context_constant = { fg = "#7dcfff" },
        context_string = { fg = "#9ece6a" },
        context_number = { fg = "#9ece6a" },
        context_boolean = { fg = "#9ece6a" },
        context_array = { fg = "#7dcfff" },
        context_object = { fg = "#7dcfff" },
        context_key = { fg = "#9ece6a" },
        context_null = { fg = "#bb9af7" },
        context_enum_member = { fg = "#7aa2f7" },
        context_struct = { fg = "#73daca" },
        context_event = { fg = "#ff9e64" },
        context_operator = { fg = "#f7768e" },
        context_type_parameter = { fg = "#73daca" }
      }
    }
  }
}
