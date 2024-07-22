require("mason").setup()
require("mason-lspconfig").setup()

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
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    end
}
require("lspconfig").ruff.setup{
    on_attach = function(client, bufnr)
        client.server_capabilities.hoverProvider = false
    end,
}

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
