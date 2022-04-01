-- enable lsp plugin
local nvim_lsp = require("lspconfig")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- wrapper functions
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    -- local function buf_set_option(...)
    --     vim.api.nvim_buf_set_option(bufnr, ...)
    -- end

    -- Enable completion triggered by <c-x><c-o>
    -- buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    local opts = {noremap = true, silent = true}

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "<space>K", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", "<space>K", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
    buf_set_keymap("n", "<space><CR>", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

-- used for cmp completions
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
-- lsp configs below
-- [[ info on lsp stuff
-- keep on_attach and capabilities in all setup functions
-- find more configs in https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
-- install language servers with lsp installer https://github.com/williamboman/nvim-lsp-installer/
-- ]]
-- lua

local system_name = "Linux"
local sumneko_root_path = "/home/tusqasi/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/"
local sumneko_binary = sumneko_root_path .. "/bin/" .. system_name .. "/lua-language-server"

local luadev =
    require("lua-dev").setup(
    {
        lspconfig = {
            cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
            init_options = {formatting = true},
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = {
                        -- declare vim as a global so no warning
                        globals = {
                            "vim",
                            "use"
                        }
                    }
                }
            }
        }
    }
)
nvim_lsp.sumneko_lua.setup(luadev)

-- nvim_lsp.sumneko_lua.setup {
--     cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
--     init_options = {formatting = true},
--     capabilities = capabilities,
--     on_attach = on_attach,
--     settings = {
--         Lua = {
--             diagnostics = {
--                 -- declare vim as a global so no warning
--                 globals = {
--                     "vim",
--                     "use"
--                 }
--             }
--         }
--     }
-- }

-- dart
nvim_lsp.dartls.setup {
    init_options = {formatting = true},
    capabilities = capabilities,
    on_attach = on_attach
}
nvim_lsp.kotlin_language_server.setup {
    cmd = {vim.fn.expand("~") .. "/" .. ".local/share/nvim/lsp_servers/kotlin/server/bin/kotlin-language-server"}
}

-- java
--[[ require "lspconfig".java_language_server.setup {
  cmd = {"/home/tusqasi/clones/java-language-server/dist/launch_linux.sh"},
  root_dir = function(startpath)
    return "./"
  end
} ]]
-- java but eclipse
-- require "lspconfig".jdtls.setup {
--   capabilities = capabilities,
--   on_attach = on_attach
-- }

-- nvim_lsp.pyright.setup {
--     capabilities = capabilities,
--     on_attach = on_attach
-- }
-- pylsp
-- nvim_lsp.pylsp.setup {
--     capabilities = capabilities,
--     on_attach = on_attach
-- }

-- jedi
nvim_lsp.jedi_language_server.setup {
    capabilities = capabilities,
    on_attach = on_attach
}

-- clang
nvim_lsp.clangd.setup {
    capabilities = capabilities,
    on_attach = on_attach
}

-- vimls
-- require "lspconfig".vimls.setup {
--   capabilities = capabilities,
--   on_attach = on_attach
-- }
-- require "lspconfig".tsserver.setup {
--   capabilities = capabilities,
--   on_attach = on_attach
-- }
