require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {"pyright", "ruff", "gopls"},
    automatic_installation = true,
})


--  ______   _______ _   _  ___  _   _ 
-- |  _ \ \ / /_   _| | | |/ _ \| \ | |
-- | |_) \ V /  | | | |_| | | | |  \| |
-- |  __/ | |   | | |  _  | |_| | |\  |
-- |_|    |_|   |_| |_| |_|\___/|_| \_|
--                                     

local function start_pyright_lsp_server() 
    require("lspconfig").pyright.setup{
        settings = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
                autoImportCompletions = true,
            }
        },
        on_attach = function(client, bufnr)
            local opts = { noremap = true, buffer = bufnr }
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename , opts)
        end
    }
end

local function start_ruff_lsp_server()
    require("lspconfig").ruff.setup{
        on_attach = function(client, bufnr)
            client.server_capabilities.hoverProvider = false
        end,
    }
end

local function start_python_lsp_servers()
    start_pyright_lsp_server()
    start_ruff_lsp_server()
end

local function toggle_python_lsp_servers()
    local pyright_client = vim.lsp.get_active_clients({ name = "pyright" })[1]
    local ruff_client = vim.lsp.get_active_clients({ name = "ruff" })[1]

    if pyright_client or ruff_client then
        if pyright_client then
            vim.lsp.stop_client(pyright_client.id)
        end

        if ruff_client then
            vim.lsp.stop_client(ruff_client.id)
        end
    else
        start_python_lsp_servers()
    end
end

vim.api.nvim_create_user_command('TogglePythonLSPServers', toggle_python_lsp_servers, {})

start_python_lsp_servers()

local function format_ruff()
    vim.lsp.buf.format({
        name = "ruff",
        timeout_ms = 1000,
    })
end

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.py",
    callback = function()
        format_ruff()
    end,
})

-- disable inline diagnostics
vim.diagnostic.config({
    underline = true,
    virtual_text = false,
    signs = true,
})

local function show_diagnostics()
    local opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = "rounded",
        source = "always",
        header = ":(",
        scope = "cursor"
    }
    vim.diagnostic.open_float(nil, opts)
end

vim.keymap.set("n", "<leader>d", show_diagnostics, { noremap = true, silent = true })


--   ____  ___  
--  / ___|/ _ \ 
-- | |  _| | | |
-- | |_| | |_| |
--  \____|\___/ 
--              

require("lspconfig").gopls.setup{
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
    on_attach = function(client, bufnr)
        local opts = { noremap = true, buffer = bufnr }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    end
}

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        local tmpfile = vim.fn.tempname() .. ".go"
        vim.api.nvim_command("write!" .. tmpfile)
        local output = vim.fn.system(string.format("golines -w %s --max-len=88", tmpfile))

        if vim.v.shell_error ~= 0 then
            vim.api.nvim_err_writeln("golines failed: " .. output)
        else
            local lines = vim.fn.readfile(tmpfile)
            vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
        end

        vim.fn.delete(tmpfile)
    end,
})
