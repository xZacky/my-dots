return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("kanagawa").setup {
        commentStyle = { italic = false },
        functionStyle = {},
        keywordStyle = { bold = false, italic = false },
        statementStyle = { bold = false },
        typeStyle = { bold = false },
        background = { dark = "wave" },
        -- customized colors (from tokyonight)
        -- black0: #0c0c14
        -- black1: #101018
        -- black2: #12121a
        -- black3: #16161e
        -- black4: #242836
        -- black5: #292e42
        -- black6: #545c7e
        -- gray: #666f99
        -- white: #c0caf5
        -- red: #db4b4b
        -- pink: #f7768e
        -- orange: #ff9e64
        -- green: #9ece6a
        -- aqua: #73daca
        -- cyan: #7dcfff
        -- blue: #7aa2f7
        -- darkBlue: #283457
        -- magenta: #bb9af7
        colors = {
          palette = {
            sumiInk0 = "#0c0c14",      -- black0
            sumiInk1 = "#101018",      -- black1
            sumiInk2 = "#12121a",      -- black2
            sumiInk3 = "#16161e",      -- black3
            sumiInk4 = "#242836",      -- black4
            sumiInk5 = "#292e42",      -- black5
            sumiInk6 = "#545c7e",      -- black6
            fujiWhite = "#c0caf5",     -- white
            carpYellow = "#ff9e64",    -- orange
            surimiOrange = "#ff9e64",  -- orange
            sakuraPink = "#f7768e",    -- pink
            springGreen = "#9ece6a",   -- green
            crystalBlue = "#7dcfff",   -- cyan
            waveAqua2 = "#73daca",     -- aqua
            springViolet2 = "#7aa2f7", -- blue
            oniViolet = "#bb9af7"      -- magenta
          },
          theme = {
            wave = {
              ui = {
                fg_dim = "#c0caf5",    -- white
                special = "#7aa2f7",   -- blue
                bg_gutter = "#16161e", -- black3
                bg_search = "#283457", -- darkBlue
                bg_visual = "#283457", -- darkBlue
                pmenu = {
                  fg = "#c0caf5",      -- white
                  fg_sel = "none",
                  bg = "#242836",      -- black4
                  bg_sel = "#545c7e"   -- black6
                },
                float = {
                  fg = "#c0caf5",        -- white
                  fg_border = "#242836", -- black4
                  bg = "#242836",        -- black4
                  bg_border = "#242836"  -- black4
                }
              },
              syn = {
                variable = "#7dcfff",   -- cyan
                number = "#9ece6a",     -- green
                constant = "none",      -- do not use specific for constant
                identifier = "#7aa2f7", -- blue
                parameter = "#7dcfff",  -- cyan
                fun = "#ff9e64",        -- orange
                operator = "#f7768e",   -- pink
                preproc = "#bb9af7",    -- magenta
                type = "#73daca",       -- aqua
                regex = "#9ece6a",      -- green
                comment = "#666f99",    -- gray
                punct = "#bb9af7",      -- magenta
                special1 = "#ff9e64",   -- function call, orange
                special2 = "#7aa2f7",   -- blue
                special3 = "#bb9af7"    -- return, magenta
              },
              diag = {
                error = "#db4b4b",   -- red
                warning = "#ff9e64", -- orange
                info = "#7dcfff",    -- cyan
                hint = "#73daca"     -- aqua
              }
            }
          }
        },
        overrides = function(colors)
          return {
            -- syntax
            Boolean = { fg = colors.theme.syn.number, bold = false },
            -- treesitter
            ["@constant.builtin"] = { fg = colors.theme.syn.number },
            ["@keyword.directive"] = { fg = colors.theme.syn.preproc },
            ["@keyword.operator"] = { bold = false },
            ["@punctuation.special"] = { fg = colors.theme.syn.punct },
            ["@string.escape"] = { bold = false },
            ["@string.special"] = { fg = colors.theme.syn.string },
            ["@type.builtin"] = { fg = colors.theme.syn.type },
            ["@variable.builtin"] = { fg = colors.theme.syn.identifier, italic = false },
            -- lsp
            ["@lsp.type.bracket"] = { fg = colors.theme.syn.punct },
            ["@lsp.type.comment"] = { fg = colors.theme.syn.comment },
            ["@lsp.type.enumMember"] = { fg = colors.theme.syn.identifier },
            ["@lsp.type.macro"] = { fg = colors.theme.syn.preproc },
            ["@lsp.type.modifier"] = { fg = colors.theme.syn.keyword },
            ["@lsp.type.namespace"] = { fg = colors.theme.syn.identifier },
            ["@lsp.type.operator"] = { fg = "none" },
            ["@lsp.type.variable"] = { fg = colors.theme.syn.variable },
            ["@lsp.typemod.function.defaultLibrary"] = { fg = colors.theme.syn.fun },
            ["@lsp.typemod.method.defaultLibrary"] = { fg = colors.theme.syn.fun },
            ["@lsp.typemod.operator.declaration"] = { fg = colors.theme.syn.fun },
            ["@lsp.typemod.operator.definition"] = { fg = colors.theme.syn.fun },
            ["@lsp.typemod.variable.classScope"] = { fg = colors.theme.syn.identifier },
            ["@lsp.typemod.variable.defaultLibrary"] = { fg = colors.theme.syn.variable },
            -- cpp
            ["@keyword.conditional.ternary.cpp"] = { fg = colors.theme.syn.operator },
            ["@variable.cpp"] = { fg = colors.theme.syn.variable },
            ["@function.builtin.cpp"] = { fg = colors.theme.syn.keyword },
            -- tablegen
            ["@keyword.import.tablegen"] = { fg = colors.theme.syn.keyword },
            ["@type.builtin.tablegen"] = { fg = colors.theme.syn.keyword },
            ["@variable.builtin.tablegen"] = { fg = colors.theme.syn.variable, italic = false },
            ["@variable.tablegen"] = { fg = colors.theme.syn.type },
            ["@variable.parameter.tablegen"] = { fg = colors.theme.syn.type },
            -- python
            ["@variable.python"] = { fg = colors.theme.syn.variable },
            ["@variable.member.python"] = { fg = colors.theme.syn.variable },
            ["@constructor.python"] = { fg = colors.theme.syn.type },
            ["@function.python"] = { fg = colors.theme.syn.variable },
            ["@function.call.python"] = { fg = colors.theme.syn.variable },
            ["@function.method.python"] = { fg = colors.theme.syn.variable },
            ["@function.method.call.python"] = { fg = colors.theme.syn.variable },
            ["@function.builtin.python"] = { fg = colors.theme.syn.identifier },
            ["@attribute.builtin.python"] = { fg = colors.theme.syn.type },
            ["@character.special.python"] = { fg = colors.theme.syn.operator },
            -- lua
            ["@variable.lua"] = { fg = colors.theme.syn.variable }
          }
        end
      }
    end
  }
}
