return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require("mason").setup {
      ui = {
        keymaps = {
          toggle_help = "?"
        },
        icons = {
          package_installed = "󰄬",
          package_pending = "󱦰",
          package_uninstalled = "󰅖"
        }
      }
    }
  end
}
