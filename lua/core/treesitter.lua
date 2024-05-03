-- core/treesitter.lua
--
-- nvim-treesitter provides syntax highlighting, text objects, code indentation,
-- and other language-aware features for Neovim using Tree-sitter parsers.
require('nvim-treesitter.configs').setup {
  -- nvim-ts-context-commentstring is set up automatically
  -- ensure_installed: Add languages to be installed here that you want installed for treesitter
  ensure_installed = {
    'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx',
    'typescript', 'vimdoc', 'vim', 'vue', 'html', 'css', 'scss', 'javascript'
  },

  -- 1. Missing required fields in type `TSConfig`: `modules`, `ignore_install` [missing-fields]

  -- sync_install: Installs parsers synchronously (only related to
  -- `ensure_installed`)
  sync_install = false,

  -- auto_install: Automatically install language parsers when entering buffer.
  -- Reccomandation: Set to false if you don't use `tree-sitter` CLI. Defaults
  -- to false.
  auto_install = false,
  -- See https://github.com/nvim-treesitter/nvim-treesitter/blob/master/lua/nvim-treesitter/configs.lua
  ignore_install = {},
  modules = {},

  highlight = {
    enable = true,
    custom_captures = { ["Todo"] = "ToolbarButton" },
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },
  -- indent = { enable = true, disable = { 'python' } },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<M-space>',
    },
  },

  -- For treesitter plugin: 'nvim-treesitter/nvim-treesitter-textobjects'
  -- For `Textobjects` definedby tree-sitter queries.
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        -- ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },

  -- Sets the `commentstring` based on tree-sitter queries
  -- For treesitter plugin: 'JoosepAlviste/nvim-ts-context-commentstring'
  -- See: https://github.com/JoosepAlviste/nvim-ts-context-commentstring
  -- [Plugin docs](https://github.com/JoosepAlviste/nvim-ts-context-commentstring/blob/main/doc/nvim-ts-context-commentstring.txt)
  -- context_commentstring = { enable = true },
}

-- Setup the plugin manually rather than as an nvim-treesitter module. We do
-- this because nvim-treesitter has version > 1.0.
require('ts_context_commentstring').setup {
  context_commentstring = {
    enable = true,
    config = {
      typescript = { __default = '// %s', __multiline = '/* %s */' },
      -- some languages are not injected with language tree, but have
      -- multiple commenting styles in the same language. One such example is
      -- JavaScript with JSX. The JSX section is not an injected language, but a part
      -- of the tree generated by the `javascript` Treesitter parser.
      --
      -- In this more complex case, this plugin supports adding queries for specific
      -- Treesitter nodes. Each node can have its own unique commenting style. For
      -- example
      javascript = {
        __default = '// %s',
        jsx_element = '{/* %s */}',
        jsx_fragment = '{/* %s */}',
        jsx_attribute = '// %s',
        comment = '// %s',
      },
    }
  },
}
