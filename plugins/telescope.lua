-- plugins/telescope.lua
return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8', -- Or branch = '0.1.x'
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    local telescope = require("telescope")

    -- Setup Telescope with custom find_files options
    telescope.setup({
      defaults = {
        file_ignore_patterns = { "node_modules", ".git" }, -- Ignore unwanted folders
      },
      pickers = {
        find_files = {
          hidden = true,  -- Show hidden files
          no_ignore = true, -- Include files in ignored directories
          -- Add other custom options for find_files here
        },
      },
    })

    -- Set up custom keymap for find_files with <C-p>
    local keymap = vim.keymap.set
    keymap("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
  end,
}

