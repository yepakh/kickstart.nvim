---@module 'lazy'
---@type LazySpec
return {
  'mbbill/undotree',
  config = function() vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle) end,
}
