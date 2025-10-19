vim.api.nvim_create_user_command('Rc',
function()
	vim.api.nvim_command('!rustc %:t')
end,
{nargs = '*'})
vim.api.nvim_create_user_command('Cb',function(opts)vim.api.nvim_command('!cargo build')end,{nargs =0})
vim.api.nvim_create_user_command('Cr',function(opts)vim.api.nvim_command('!cargo run')end,{nargs =0})
vim.api.nvim_create_user_command('Cc',function(opts)vim.api.nvim_command('!cargo check')end,{nargs =0})

vim.keymap.set("n" ,"<leader>t" ,
function(opts)
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0,8)
	local job_id = vim.bo.channel
	vim.fn.chansend(job_id,{"cargo run\n"})
	vim.cmd('execute\"normal\\ A\"')
end)

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
