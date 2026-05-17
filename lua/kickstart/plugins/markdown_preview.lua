---@module 'lazy'
---@type lazyspec
return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
  config = function()
    local renderMarkdown = require 'render-markdown'
    vim.keymap.set('n', '<leader>v', function() renderMarkdown.toggle() end)
  end,
}
