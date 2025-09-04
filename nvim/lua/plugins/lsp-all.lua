-- Universal LSP setup + 'gr' references mapping
return {
  -- Make sure Mason knows which servers to install
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        -- pick what you use; safe to keep extras
        "basedpyright", -- Python (no npm needed). Or use "pyright" if you prefer.
        -- "pyright", -- Python
        "lua_ls", -- Lua / Neovim config
        "jsonls", -- JSON
        "yamlls", -- YAML
        "tsserver", -- TypeScript/JavaScript (needs node)
        "html", -- HTML
        "cssls", -- CSS
        "tailwindcss", -- Tailwind CSS
        "bashls", -- Bash/sh
        "dockerls", -- Dockerfile
        "docker_compose_language_service",
        "terraformls", -- Terraform
        "gopls", -- Go
        "rust_analyzer", -- Rust
        "marksman", -- Markdown
      },
    },
  },

  -- Configure LSP servers and global on-attach keymaps
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Optional: minimal per-server tweaks
      local servers = {
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                autoImportCompletions = true,
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
        -- pyright = {
        --   settings = {
        --     python = {
        --       analysis = {
        --         autoImportCompletions = true,
        --         useLibraryCodeForTypes = true,
        --       },
        --     },
        --   },
        -- },
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              workspace = { checkThirdParty = false },
            },
          },
        },
      }

      -- Start each server (others will use defaults)
      for name, opts in pairs(servers) do
        lspconfig[name].setup(opts)
      end

      -- LSP keymaps for any server/language
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          local ok, tb = pcall(require, "telescope.builtin")

          local function map(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
          end

          map("gd", vim.lsp.buf.definition, "LSP: definition")
          map("gD", vim.lsp.buf.declaration, "LSP: declaration")
          map("gi", vim.lsp.buf.implementation, "LSP: implementation")
          map("gt", vim.lsp.buf.type_definition, "LSP: type definition")

          if ok then
            map("gr", function()
              tb.lsp_references({ include_declaration = false })
            end, "LSP: references")
            map("gs", tb.lsp_document_symbols, "LSP: doc symbols")
            map("gS", tb.lsp_workspace_symbols, "LSP: workspace symbols")
          else
            map("gr", function()
              vim.lsp.buf.references({ includeDeclaration = false })
            end, "LSP: references")
          end
        end,
      })
    end,
  },
}
