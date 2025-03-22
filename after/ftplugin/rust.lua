vim.api.nvim_create_user_command('R',
function(opts)
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0,5)
	Job_id = vim.bo.channel

	if (opts.fargs[1] ==nil) then
	vim.fn.chansend(Job_id,{"./main\n"})
	else
	vim.fn.chansend(Job_id,{"./"..opts.fargs[1].."\n"})
	end
	vim.cmd('execute\"normal\\ A\"')
end,
{nargs = '*'})
