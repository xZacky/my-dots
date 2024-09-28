return {
  -- autopairs
  {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    opts = {
      enable_check_bracket_line = false
    }
  },
  -- comment
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {}
  },
  -- lastplace
  {
    "ethanholz/nvim-lastplace",
    config = true
  },
  -- flash
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      search = {
        multi_window = false
      },
      modes = {
        search = {
          enabled = true,
          highlight = { backdrop = true }
        }
      }
    }
  }
}
