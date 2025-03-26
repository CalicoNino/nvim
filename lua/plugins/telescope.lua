-- plugins/telescope.lua
return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8', -- Or use branch = '0.1.x' if you prefer the latest stable version
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    local telescope = require("telescope")

    -- Setup Telescope with custom options
    telescope.setup({
      defaults = {
        file_ignore_patterns = { "node_modules", ".git" }, -- Ignore unwanted folders
      },
      pickers = {
        find_files = {
          hidden = true,  -- Show hidden files
          no_ignore = true, -- Include ignored files in `.gitignore` and `.ignore`
        },
        git_files = {
          show_untracked = true,  -- Show untracked files in git
        },
        grep_string = {
          search = "",  -- Default search string for the function
        },
        live_grep = {
          additional_args = function() return {"--ignore-file", ".gitignore"} end,  -- Ignore files listed in .gitignore
        },
      },
    })

    -- Keymap for find_files (C-p)
    vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Find files" })

    -- Keymap for git_files (C-g)
    vim.keymap.set("n", "<C-g>", "<cmd>Telescope git_files<cr>", { desc = "Find files in git repo" })

    -- Keymap for grep_string (C-s)
    vim.keymap.set("n", "<C-s>", "<cmd>Telescope grep_string<cr>", { desc = "Search for string under cursor" })

    -- Keymap for live_grep (C-f)
    vim.keymap.set("n", "<C-f>", "<cmd>Telescope live_grep<cr>", { desc = "Live grep search" })
  end,
}

