-- show full-width space and other special spaces
vim.api.nvim_create_augroup('extra-whitespace', {})
vim.api.nvim_create_autocmd({ 'VimEnter', 'WinEnter' }, {
  group = 'extra-whitespace',
  pattern = { '*' },
  command = [[call matchadd('ExtraWhitespace', "[\u00A0\u2000-\u200B\u3000]")]],
})
vim.api.nvim_create_autocmd({ 'ColorScheme' }, {
  group = 'extra-whitespace',
  pattern = { '*' },
  command = [[highlight default ExtraWhitespace ctermbg=202 ctermfg=202 guibg=salmon]],
})
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
