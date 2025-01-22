return {
  "neovim/nvim-lspconfig",
  event = {
    "BufReadPost",
    "BufNewFile"
  },
  cmd = "Neoconf",
  dependencies = {
    "folke/neoconf.nvim",
    "folke/neodev.nvim",
    "williamboman/mason-lspconfig"
  },
  config = function()
    -- language servers
    local servers = {
      bashls = {},
      clangd = {},
      -- note: to use cmake-language-server with pyenv-virtualenv, modify cmake-language-server
      -- under ~/.local/share/nvim/mason/packages/cmake-language-server to use the python
      -- under ~/.pyenv/versions/<venv>/bin
      cmake = {},
      jsonls = {},
      lua_ls = {
        Lua = {
          completion = {
            autoRequire = false,
            keywordSnippet = "Disable",
            showWord = "Disable",
            workspaceWord = false
          },
          runtime = { version = "LuaJIT" },
          workspace = {
            checkThirdParty = "Disable",
            ignoreDir = { ".cache", ".git", "build" },
            library = { vim.env.VIMRUNTIME }
          }
        }
      },
      marksman = {},
      pyright = {
        pyright = {
          disableTaggedHints = true,
        },
        python = {
          analysis = {
            typeCheckingMode = "basic"
          }
        }
      }
    }

    local on_attach = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<Leader>h", "<Cmd>lua vim.lsp.buf.hover()<CR>")
      vim.keymap.set("n", "<Leader>o", "<Cmd>lua vim.diagnostic.open_float()<CR>")
      vim.keymap.set("n", "<Leader>p", "<Cmd>lua vim.lsp.buf.declaration()<CR>")
      vim.keymap.set("n", "<Leader>d", builtin.lsp_definitions)
      vim.keymap.set("n", "<Leader>r", builtin.lsp_references)
      vim.keymap.set("n", "<Leader>a", "<Cmd>lua vim.lsp.buf.code_action()<CR>")
      vim.keymap.set("n", "<Leader>n", "<Cmd>lua vim.lsp.buf.rename()<CR>")
      vim.keymap.set("n", "<Leader>m", "<Cmd>lua vim.lsp.buf.format()<CR>")

      vim.keymap.set("n", "<Leader>fd", builtin.lsp_document_symbols)
    end

    -- capabilities for auto completion
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    require("neoconf").setup()
    require("neodev").setup()

    ---@diagnostic disable-next-line: missing-fields
    require("mason-lspconfig").setup {
      ensure_installed = vim.tbl_keys(servers),
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup {
            settings = servers[server_name],
            on_attach = on_attach,
            capabilities = capabilities
          }
        end
      }
    }

    -- self installed language servers
    -- tablegen
    require("lspconfig").tblgen_lsp_server.setup {
      cmd = {
        "tblgen-lsp-server",
        "--tablegen-compilation-database=build/tablegen_compile_commands.yml"
      },
      on_attach = on_attach,
      capabilities = capabilities
    }
    -- mlir
    -- require("lspconfig").mlir_lsp_server.setup {
    --   cmd = {
    --     "mlir-lsp-server",
    --     "--pretty"
    --   },
    --   on_attach = on_attach,
    --   capabilities = capabilities
    -- }

    vim.diagnostic.config {
      virtual_text = false,
      severity_sort = true
    }
    vim.cmd("sign define DiagnosticSignError text= texthl=DiagnosticSignError")
    vim.cmd("sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn")
    vim.cmd("sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo")
    vim.cmd("sign define DiagnosticSignHint text= texthl=DiagnosticSignHint")
  end
}
