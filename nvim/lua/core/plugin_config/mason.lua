require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "cmake", "cssls", "html", "jsonls", "tsserver", "marksman", "intelephense", "prismals", "pyright" },
}
