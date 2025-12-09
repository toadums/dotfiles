-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Delete some LazyVim keymaps
vim.keymap.del({ "n", "v" }, "S")
vim.keymap.del({ "n", "v" }, "s")
vim.keymap.del({ "n" }, "L")
vim.keymap.set("i", "jk", "<ESC>")

vim.keymap.set("n", "<leader>d", ":vsp %:h/<c-z>")
vim.keymap.set("n", "<leader>e", ":e %:h/<c-z>")

if not vim.g.vscode then
  vim.keymap.set("n", "-", ":Oil<CR>")
end

-- VS Code Bindings
-- Default oil.code keymaps
if vim.g.vscode then
  local vscode = require("vscode")
  local map = vim.keymap.set
  vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*" },
    callback = function()
      map("n", "-", function()
        vscode.action("oil-code.open")
      end)
    end,
  })

  vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "oil" },
    callback = function()
      map("n", "-", function()
        vscode.action("oil-code.openParent")
      end)
      map("n", "_", function()
        vscode.action("oil-code.openCwd")
      end)
      map("n", "<CR>", function()
        vscode.action("oil-code.select")
      end)
      map("n", "<C-t>", function()
        vscode.action("oil-code.selectTab")
      end)
      map("n", "<C-l>", function()
        vscode.action("oil-code.refresh")
      end)
      map("n", "`", function()
        vscode.action("oil-code.cd")
      end)
    end,
  })
end
