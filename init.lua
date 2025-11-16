vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

if vim.loader then
	vim.loader.enable()
end

---@diagnostic disable-next-line: duplicate-set-field
_G.dd = function(...)
	require("util.debug").dump(...)
end
vim.print = _G.dd

require("config.lazy")

vim.cmd("colorscheme kanagawa")
