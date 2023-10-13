local M = {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- calling `setup` is optional for customization
    local fzf = require("fzf-lua")
    vim.keymap.set("n", "<leader>fg", fzf.live_grep, {silent = true})
  end
}

return M
