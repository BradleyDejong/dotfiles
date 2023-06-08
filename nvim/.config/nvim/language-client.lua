local on_attach = function(client, bufnr)
end

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- local capabilities = require('cmp_nvim_lsp').default_capabilities()

--[[

local servers = { 'vuels', 'eslint', 'tsserver', 'jdtls' }

require("mason").setup()
require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function (server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {}
  end,
  -- Next, you can provide a dedicated handler for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
  --["rust_analyzer"] = function ()
    --require("rust-tools").setup {}
  --end
}

for _, lsp in pairs(servers) do
   require('lspconfig')[lsp].setup{
     on_attach = on_attach,
     capabilities = capabilities
   }
 end
local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  formatting = {
    -- format = lspkind.cmp_format(),
  },
  window = {
  },
  mapping = cmp.mapping.preset.insert({
    -- ['<C-j>'] = cmp.mapping.select_next_item(),
    -- ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
  }, {
    { name = 'buffer' },
  })
})

vim.opt.completeopt={"menu", "menuone"}
]]
