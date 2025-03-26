vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

require("my_settings")
require("config.lazy")
vim.cmd("colorscheme kanagawa")
