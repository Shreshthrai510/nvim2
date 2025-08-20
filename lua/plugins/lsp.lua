return {
    {
        "neovim/nvim-lspconfig",
        opts = {
      autoformat = false,
    },
        dependencies = {
            'saghen/blink.cmp',
            {
                "folke/lazydev.nvim",
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            -- LSP Servers setup
            local servers = {
                lua_ls = {
                --    cmd = {
                --        "C:\\Users\\shreshth.rai\\Documents\\LSP\\bin\\lua-language-server"
                --    },
                --    settings = {
                --        Lua = {
                --            runtime = { version = "LuaJIT" },
                --            diagnostics = { globals = { "vim" } },
                --            workspace = {
                --                library = vim.api.nvim_get_runtime_file("", true),
                --                checkThirdParty = false,
                --            },
                --            telemetry = { enable = false },
                --        }
                --    }
                }, -- Lua
                cssls = {
                   -- cmd = { "node", "C:\\ZippingIt\\MyFiles\\node_modules\\vscode-css-languageserver-bin\\cssServerMain.js", "--stdio" },
                }, -- HTML
                jsonls = {
                   -- cmd = { "node", "C:\\ZippingIt\\MyFiles\\node_modules\\vscode-json-languageserver-bin\\jsonServerMain.js", "--stdio" },
                }, -- HTML
                html = {
                  --  cmd = { "node", "C:\\ZippingIt\\MyFiles\\node_modules\\vscode-html-languageserver-bin\\htmlServerMain.js", "--stdio" },
                }, -- HTML
                ts_ls = {
                    --cmd = {
                    --    "node",
                    --    "C:\\Users\\shreshth.rai\\TS_LS\\ZippingIt\\node_modules\\typescript-language-server\\lib\\cli.mjs",
                    --    "--stdio"
                    --}
                }, -- JS, JSX, TS, TSX
                svelte = {
                   -- cmd = {
                   --     "node",
                   --     "C:\\Users\\shreshth.rai\\AppData\\Local\\nvim\\ZippingIt\\node_modules\\svelte-language-server\\bin\\server.js",
                   --     "--stdio"
                   -- },
                }, -- Svelte
                tailwindcss = {
                }, -- TailwindCSS
            }

            for server, opts in pairs(servers) do
                opts.capabilities = capabilities
                lspconfig[server].setup(opts)
            end

            -- Auto format on save for supported filetypes
            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(args)
                    local c = vim.lsp.get_client_by_id(args.data.client_id)
                    if not c then return end

                    local format_filetypes = {
                        lua = false,
                        html = false,
                        javascript = false,
                        javascriptreact = false,
                        typescript = false,
                        typescriptreact = false,
                        svelte = true,
                        json = false,
                        css = false,
                    }

                    if format_filetypes[vim.bo[args.buf].filetype] then
                        vim.api.nvim_create_autocmd('BufWritePre', {
                            buffer = args.buf,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = args.buf, id = c.id })
                            end,
                        })
                    end
                end,
            })
        end,
    }
}
