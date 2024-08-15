return {
  "nvim-treesitter/nvim-treesitter",
  event = {
    "BufReadPost",
    "BufNewFile"
  },
  dependencies = {
    "nvim-treesitter/playground"
  },
  build = ":TSUpdate",
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require("nvim-treesitter.configs").setup {
      highlight = {
        enable = true,
        disable = {
          "mlir"
        },
        additional_vim_regex_highlighting = false
      },
      indent = {
        enable = false
      },
      auto_install = true,
      ensure_installed = {
        "lua"
      },
      playground = {
        enable = true
      }
    }
    require("vim.treesitter.query").set("tablegen", "injections", "")
  end
}
