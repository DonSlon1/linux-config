local rt = require("rust-tools")
local mason_registry = require("mason-registry")

local codelldb = mason_registry.get_package("codelldb")
local extension_path = codelldb:get_install_path() .. "/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"

local widgets = require('dap.ui.widgets');
local sidebar = widgets.sidebar(widgets.scopes);
-- rt.setup({
--   dap = {
--     adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
--   },
--   server = {
--     capabilities = require("cmp_nvim_lsp").default_capabilities(),
--     on_attach = function(_, bufnr)
--       vim.keymap.set("n", "<Leader>k", rt.hover_actions.hover_actions, { buffer = bufnr })
--       vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
--     end,
--   },
--   tools = {
--     hover_actions = {
--       auto_focus = true,
--     },
--   },
-- })

-- Update this path
local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.9.2/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb'
local this_os = vim.loop.os_uname().sysname;

-- The path in windows is different
if this_os:find "Windows" then
  codelldb_path = extension_path .. "adapter\\codelldb.exe"
  liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
else
  -- The liblldb extension is .so for linux and .dylib for macOS
  liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
end

local opts = {
    -- ... other configs
    server = {
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
      on_attach = function(_, bufnr)
        vim.keymap.set("n", "<Leader>k", rt.hover_actions.hover_actions, { buffer = bufnr })
        vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
      end,
    },
    dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(
            codelldb_path, liblldb_path)
    },
  tools = {
    hover_actions = {
      auto_focus = true,
    },
  },

}

-- Normal setup
require('rust-tools').setup(opts)

vim.keymap.set("n", "<Leader>db", "<cmd> DapToggleBreakpoint <CR>")
vim.keymap.set("n", "<Leader>dus", sidebar.open)
