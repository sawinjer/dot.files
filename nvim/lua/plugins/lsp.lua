return {
  {
    "williamboman/mason-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },
    event = "VeryLazy",
    config = function()
      local lsp_default_servers = {
        "html",
        "cssls",
        "tailwindcss",
        "clangd",
        "gopls",
        "marksman", -- markdown
        "ruff",     -- python
        "rust_analyzer",
        "sqls",
        "yamlls",
        "taplo", -- toml
        "emmet_ls",
        "volar", -- Vue
        "biome",
        "somesass_ls",
        "ts_ls",
        "lua_ls",
        "eslint",
        "pylsp",
        "vuels",
      }
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = lsp_default_servers,
      })

      local lspconfig = require("lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        local keymap = vim.keymap
        -- set keybinds
        keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts)                         -- show definition, references
        keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)                -- see definition and make edits in window
        keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)       -- go to implementation
        keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)            -- see available code actions
        keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)                 -- smart rename
        keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)   -- show  diagnostics for line
        keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
        keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)           -- jump to previous diagnostic in buffer
        keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)           -- jump to next diagnostic in buffer
        keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)                       -- show documentation for what is under cursor
        keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)                 -- see outline on right hand side

        -- typescript specific keymaps (e.g. rename file and update imports)
        if client.name == "ts_ls" then
          keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>")      -- rename file and update imports
          keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
        end
      end

      -- used to enable autocompletion (assign to every lsp server config)
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- Change the Diagnostic symbols in the sign column (gutter)
      -- (not in youtube nvim video)
      local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }

      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      for _, server in pairs(lsp_default_servers) do
        lspconfig[server].setup({
          autostart = true,
          capabilities = capabilities,
          on_attach = on_attach,
        })
      end

      -- configure emmet language server
      lspconfig["emmet_ls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
      })

      -- configure lua server (with special settings)
      lspconfig["lua_ls"].setup({
        autostart = true,
        capabilities = capabilities,
        on_attach = on_attach,
        settings = { -- custom settings for lua
          Lua = {
            -- make the language server recognize "vim" global
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              -- make language server aware of runtime files
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        },
      })

      lspconfig["ts_ls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig["tailwindcss"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        tailwindCSS = {
          classAttributes = { "class", "className", "class:list", "classList", "ngClass", "classes" },
        },
      })
    end,
    keys = {
      { "<leader>rs", ":LspRestart<CR>" },
    },
  },
  {
    "nvimdev/lspsaga.nvim",
    opts = {
      scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
      definition = {
        edit = "<CR>",
      },
      ui = {
        colors = {
          normal_bg = "#022746",
        },
      },
    },
  },
}
