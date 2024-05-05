-- these modules are not loaded by lazy
require("core.options")
require("core.keymaps")
require("core.file-types")

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath
  }
end
vim.opt.rtp:prepend(lazypath)

-- initialize lazy with loading in the plugins directory
require("lazy").setup("plugins", {
  ui = {
    backdrop = 100,
    icons = {
      cmd = "",
      config = "",
      event = "󱐋",
      ft = "",
      import = "",
      init = "",
      plugin = "",
      runtime = "",
      require = "",
      source = "",
      start = "󰐊",
      task = "󰄬"
    }
  }
})

vim.cmd("colorscheme kanagawa")

-- override icons
require("extra.icons")
