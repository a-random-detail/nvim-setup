local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'rust_analyzer',
  'omnisharp',
  'csharp_ls',
  'lua_ls',
  'angularls',
  'dockerls',
  'docker_compose_language_service',
  'jdtls',
  'terraformls',
  'yamlls'
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()


local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>rf", function() vim.lsp.buf.formatting() end, opts)
  vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = {'lua_ls', 'tsserver', 'rust_analyzer', 'angularls', 'dockerls', 'docker_compose_language_service', 'jdtls', 'terraformls', 'yamlls', 'omnisharp', 'csharp_ls'},
  handlers = {
    lsp.default_setup
  }
})

local lspconfig = require('lspconfig')

lspconfig.tsserver.setup({
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
  end
})

lspconfig.lua_ls.setup({
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
  end
})

lspconfig.rust_analyzer.setup({
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
  end
})

lspconfig.omnisharp.setup({
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
  end
})

lspconfig.csharp_ls.setup({
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
  end
})

lspconfig.angularls.setup({
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
  end
})

lspconfig.dockerls.setup({
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
  end
})

lspconfig.docker_compose_language_service.setup({
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
  end
})

lspconfig.jdtls.setup({
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
  end
})

lspconfig.terraformls.setup({
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
  end
})

lspconfig.yamlls.setup({
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
  end
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
