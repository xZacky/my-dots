return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
    },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable "make" == 1
      end
    }
  },
  config = function()
    require("telescope").setup {
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do excat match
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case" -- or "ignore_case" or "respect_case"
        }
      }
    }
    require("telescope").load_extension("fzf")

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<Leader>ff", builtin.find_files)
    vim.keymap.set("n", "<Leader>fg", builtin.live_grep)
    vim.keymap.set("n", "<Leader>fb", builtin.buffers)
    vim.keymap.set("n", "<Leader>fh", builtin.help_tags)
    vim.keymap.set("n", "<Leader>fs", builtin.current_buffer_fuzzy_find)
    -- use "<Leader>fd" to find document symbols when lsp attached.

    vim.cmd("highlight TelescopeBorder guifg=#545c7e") -- black6
    vim.cmd("highlight TelescopeTitle guifg=#545c7e") -- black6
  end
}
