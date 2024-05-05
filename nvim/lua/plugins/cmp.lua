return {
  "hrsh7th/nvim-cmp",
  event = {
    "InsertEnter",
    "CmdlineEnter"
  },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    {
      "saadparwaiz1/cmp_luasnip",
      dependencies = {
        "L3MON4D3/LuaSnip",
        dependencies = {
          "rafamadriz/friendly-snippets"
        }
      }
    }
  },
  config = function()
    local cmp = require("cmp")
    local compare = require("cmp.config.compare")
    local luasnip = require("luasnip")

    require("luasnip.loaders.from_vscode").lazy_load()
    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end
      },
      sources = cmp.config.sources {
        { name = "nvim_lsp" },
        { name = "luasnip" }
      },
      mapping = cmp.mapping.preset.insert {
        ["<Tab>"] = cmp.mapping(
          function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end,
          { "i", "s" }
        ),
        ["<S-Tab>"] = cmp.mapping(
          function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end,
          { "i", "s" }
        ),
        ["<CR>"] = cmp.mapping.confirm {
          select = false
        }
      },
      window = {
        completion = {
          border = "none",
          scrollbar = false
        },
        documentation = cmp.config.disable
      },
      sorting = {
        priority_weight = 1.0,
        comparators = {
          compare.recently_used,
          compare.locality,
          compare.exact,
          compare.offset
        }
      }
    }

    cmp.setup.cmdline(
      "/",
      {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" }
        }
      }
    )

    cmp.setup.cmdline(
      ":",
      {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources {
          { name = "path" },
          { name = "cmdline" }
        }
      }
    )
  end
}
