vim.keymap.set("n" ,"<leader>;" ,
function()
	vim.cmd('echo "python?"')
end)

vim.keymap.set("n" ,"<leader>t" ,
function()
	File_name1 = vim.fn.expand("%:t")
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0,8)
	local job_id = vim.bo.channel
	vim.fn.chansend(job_id,{"python.exe "..File_name1.."\n"})
	vim.cmd('execute\"normal\\ A\"')
end)

