local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
}

telescope.load_extension("file_browser")

vim.keymap.set('n', '<leader>f',
  function()
    builtin.find_files({
      no_ignore = false,
      hidden = true
    })
  end)
vim.keymap.set('n', '<leader>r', function()
  builtin.live_grep()
end)
vim.keymap.set('n', '<leader>b', function()
  builtin.buffers()
end)
vim.keymap.set('n', '<leader>y', function()
  builtin.diagnostics()
end)
