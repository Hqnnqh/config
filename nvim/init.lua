-- Set options
vim.opt.number = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.mouse = "a"

-- Disable Copilot by default
vim.g.copilot_enabled = false

-- Update CWD anytime a new directory is made root
vim.g.NERDTreeChDirMode = 2

-- Rust: format on save
vim.g.rustfmt_autosave = 1
vim.lsp.inlay_hint.enable(true, { 0 })

-- Plugin management with Packer
require('packer').startup(function(use)
  use 'https://github.com/vim-airline/vim-airline'
  use 'https://github.com/preservim/nerdtree'
  use 'https://github.com/preservim/tagbar'
  use 'https://github.com/ap/vim-css-color'
  use 'https://github.com/ryanoasis/vim-devicons'
  use 'https://github.com/rafi/awesome-vim-colorschemes'
  -- Fuzzy finder
  use 'nvim-lua/plenary.nvim'
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.5' }

  -- Terminal
  use { 'akinsho/toggleterm.nvim', tag = '*' }

  -- LSP and completion
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  -- Copilot
  use 'github/copilot.vim'

  -- Undotree
  use 'mbbill/undotree'

  -- Git signs
  use 'lewis6991/gitsigns.nvim'
end)

-- Key mappings
vim.api.nvim_set_keymap('n', '<C-t>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-g>', ':TagbarToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-f>', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-u>', ':UndotreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap(
  'n',
  '<C-h>',
  ":ToggleTerm dir=<C-r>=getcwd()<CR><CR>",
  { noremap = true, silent = true }
)
-- Set colorscheme
vim.cmd('colorscheme orbital')

-- Plugin setup
-- Toggleterm
require('toggleterm').setup()

-- Gitsigns
require('gitsigns').setup()

-- Nvim-cmp setup
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  })
})

-- Filetype-specific configuration
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' },
  }, {
    { name = 'buffer' },
  })
})

-- Command-line completion
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- LSP configuration
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').rust_analyzer.setup {
  capabilities = capabilities,
}
require('lspconfig').asm_lsp.setup {
  capabilities = capabilities
}
require('lspconfig').clangd.setup {
  capabilities = capabilities
}

