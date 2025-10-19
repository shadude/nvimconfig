vim.g.mapleader = " "
vim.keymap.set("n" ,"<leader>pv" , vim.cmd.Ex)

vim.keymap.set("n" ,"<leader>ev" ,
function()
	vim.api.nvim_command('vsplit /home/shankar/.config/nvim/init.lua')
	vim.cmd.Ex()
end)

vim.keymap.set("n" ,"<leader>n" ,
function()
	vim.api.nvim_command('noh')
end)

vim.keymap.set("n" ,"<leader>;" ,
function()
	vim.cmd('execute\"normal mqA;\\<esc>\\`q\"')
end)

vim.keymap.set("n" ,"<leader>=" ,
function()
	vim.cmd('execute\"normal mq\\gg\\V\\G\\==\\<esc>\\`q\"')
end)
vim.keymap.set("n" ,"<leader>ca" ,
function()
	vim.cmd('execute\"normal mq\\gg\\V\\G\\\"\\+\\y\\<esc>\\`q\"')
end)

vim.keymap.set("n" ,"<leader>va" ,
function()
	vim.cmd('execute\"normal mq\\gg\\V\\G\"')
end)
vim.keymap.set("t","<C-space>",
function()
	vim.cmd(':q')
end)
vim.keymap.set("t","<C-w>",'<C-\\><C-n>')

vim.keymap.set("n","<leader>t",
function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0,8)
	vim.cmd('execute\"normal\\ A\"')
end)
vim.keymap.set("n","<leader><leader>x","!source %<CR>")
vim.keymap.set("n","<leader>x",":.lua<CR>")
vim.keymap.set("v","<leader>x",":lua<CR>")
vim.keymap.set("v","<leader>y","\"+y")
vim.keymap.set("v","<leader>p","\"+p")
vim.keymap.set("n","<leader>p","\"+p")
vim.keymap.set("n","<leader>l",":LspStop<Cr>")
vim.keymap.set("n","<leader>s",
function ()
	vim.api.nvim_command("execute \"!sn\"")
end
)
vim.keymap.set("n","<C-z>",":echo 'nop'<CR>")

vim.api.nvim_create_autocmd('TextYankPost',{
	desc ='highlight when yanking text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank',{ clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
