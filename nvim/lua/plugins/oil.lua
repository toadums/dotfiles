return {
  "stevearc/oil.nvim",
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    require("oil").setup({
      watch_for_changes = true,
      keymaps = {
        ["<C-p>"] = false,
        ["<C-h>"] = false,
        ["<C-l>"] = false,
        ["<C-j>"] = false,
        ["<C-k>"] = false,
      },
      view_options = {
        show_hidden = true,
      },
      win_options = {
        -- Show path in winbar. Copied from https://github.com/stevearc/oil.nvim/issues/301#issuecomment-2399987685
        winbar = "%#@attribute.builtin#%{substitute(v:lua.require('oil').get_current_dir(), '^' . $HOME, '~', '')}",
      },
    })
  end,
}
