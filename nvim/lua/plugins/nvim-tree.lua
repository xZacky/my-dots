return {
  "nvim-tree/nvim-tree.lua",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons" -- show icons
  },
  config = function()
    local on_attach = function(bufnr)
      local api = require("nvim-tree.api")

      local opts = function(desc)
        return {
          desc = "nvim-tree: " .. desc,
          buffer = bufnr,
          noremap = true,
          silent = true,
          nowait = true
        }
      end

      -- custom mappings
      local keymap = vim.keymap
      keymap.set("n", "wh", api.node.open.horizontal, opts("Open: Horizontal Split"))
      keymap.set("n", "wv", api.node.open.vertical, opts("Open: Vertical Split"))
      keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
      keymap.set("n", "a", api.fs.create, opts("Create File Or Directory"))
      keymap.set("n", "c", api.fs.copy.node, opts("Copy"))
      keymap.set("n", "d", api.fs.remove, opts("Delete"))
      keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
      keymap.set("n", "o", api.node.open.edit, opts("Open"))
      keymap.set("n", "p", api.fs.paste, opts("Paste"))
      keymap.set("n", "q", api.tree.close, opts("Close"))
      keymap.set("n", "r", api.fs.rename, opts("Rename"))
      keymap.set("n", "s", api.tree.search_node, opts("Search"))
      keymap.set("n", "x", api.fs.cut, opts("Cut"))
    end

    vim.g.loaded = 1
    vim.g.loaded_netrwPlugin = 1
    require("nvim-tree").setup {
      on_attach = on_attach,
      git = { enable = false },
      renderer = {
        icons = {
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = ""
            }
          }
        }
      },
      view = { width = 32 }
    }

    vim.keymap.set("n", "<Leader>e", "<Cmd>NvimTreeToggle<CR>")
  end
}
