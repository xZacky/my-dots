return {
  "mfussenegger/nvim-dap",
  event = {
    "BufReadPost",
    "BufNewFile"
  },
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
    "jay-babu/mason-nvim-dap.nvim"
  },
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require("dapui").setup {
      expand_lines = false,
      layouts = {
        {
          elements = {
            {
              id = "console",
              size = 0.4
            },
            {
              id = "stacks",
              size = 0.3
            },
            {
              id = "breakpoints",
              size = 0.3
            }
          },
          position = "left",
          size = 33
        },
        {
          elements = {
            {
              id = "scopes",
              size = 1
            }
          },
          position = "bottom",
          size = 11
        }
      },
      mappings = {
        edit = {},
        expand = "o",
        open = "<CR>",
        repl = {}
      }
    }
    require("nvim-dap-virtual-text").setup {
      enabled = true
    }

    require("mason-nvim-dap").setup {
      ensure_installed = {
        "codelldb",
        -- note: to use debugpy with pyenv-virtualenv, modify debugpy and
        -- debugpy-adapter under ~/.local/share/nvim/mason/packages/debugpy
        -- to use the python under ~/.pyenv/versions/<venv>/bin
        "python"
      },
      automatic_installation = false,
      handlers = {
        -- all sources with no handler get passed here
        function(config)
          require("mason-nvim-dap").default_setup(config)
        end
      }
    }

    local dap, dapui = require("dap"), require("dapui")
    local dapui_open = function()
      dapui.open()
      vim.keymap.set("n", "<A-q>", "")
      vim.keymap.set("n", "<C-q>", "")
      vim.keymap.set("n", "<Leader>e", "")
      vim.keymap.set("n", ":", "")
    end
    local dapui_close = function()
      vim.keymap.set("n", "<A-q>", "<Cmd>bdelete<CR>")
      vim.keymap.set("n", "<C-q>", "<C-w>q")
      vim.keymap.set("n", "<Leader>e", "<Cmd>NvimTreeToggle<CR>")
      vim.keymap.set("n", ":", ":")
      dapui.close()
    end
    dap.listeners.after.event_initialized["dapui_config"] = dapui_open
    dap.listeners.before.event_terminated["dapui_config"] = dapui_close
    dap.listeners.before.event_exited["dapui_config"] = dapui_close

    vim.keymap.set("n", "<Leader>b", function() dap.toggle_breakpoint() end)
    vim.keymap.set("n", "<F5>", function() dap.continue() end)
    vim.keymap.set("n", "<F6>", function() dap.terminate() end)
    vim.keymap.set("n", "<F10>", function() dap.step_over() end)
    vim.keymap.set("n", "<F11>", function() dap.step_into() end)
    vim.keymap.set("n", "<F12>", function() dap.step_out() end)

    vim.cmd("highlight DapBreakpoint guifg=#db4b4b")         -- red
    vim.cmd("highlight DapBreakpointRejected guifg=#565f89") -- gray
    vim.cmd("highlight DapStopped guifg=#db4b4b")            -- red
    vim.cmd("sign define DapBreakpoint text=󰠭 texthl=DapBreakpoint")
    vim.cmd("sign define DapBreakpointRejected text=󰠭 texthl=DapBreakpointRejected")
    vim.cmd("sign define DapStopped text=󰋇 texthl=DapStopped")
  end
}
