---@module 'lazy'
---@type LazySpec
return {
  'ray-x/go.nvim',
  dependencies = { -- optional packages
    'ray-x/guihua.lua',
    'neovim/nvim-lspconfig',
    'nvim-treesitter/nvim-treesitter',
  },
  opts = function()
    require('go').setup(opts)
    local format_sync_grp = vim.api.nvim_create_augroup('GoFormat', {})
    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = '*.go',
      callback = function() require('go.format').goimports() end,
      group = format_sync_grp,
    })
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'go',
      callback = function()
        vim.o.tabstop = 4
        vim.o.shiftwidth = 4
        vim.o.expandtab = false
        vim.o.smarttab = true
        vim.o.autoindent = true

        vim.keymap.set('n', '<leader><F6>', function() vim.cmd 'split | terminal go run .' end, { buffer = true, desc = 'Go run in terminal' })
      end,
    })
    return {
      -- lsp_keymaps = false,
      -- other options
    }
  end,
  event = { 'CmdlineEnter' },
  ft = { 'go', 'gomod' },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
