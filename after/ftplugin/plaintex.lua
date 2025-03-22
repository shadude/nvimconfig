vim.api.nvim_create_user_command('Linit',
function()
	vim.api.nvim_buf_set_lines(0,0,0,true,{
		'\\documentclass[11pt,a4paper,reqno,english]{amsart}',
		'\\usepackage{../../cmds}',
		'\\title{}',
		'\\author{}',
		'\\begin{document}',
		'\\maketitle',
		'',
		'\\end{document}',
	})
end,
{})

vim.api.nvim_create_user_command('Lbe',
function(opts)
	vim.cmd('execute\"normal o\"')
	vim.cmd('execute\"normal o\"')
	vim.cmd('execute\"normal k\"')
	if opts.fargs[2] == nil  then
		vim.api.nvim_put({'\\begin{'..opts.fargs[1]..'}','\\end{'..opts.fargs[1]..'}'},"b",false,true)
	else
		vim.api.nvim_put({'\\begin{'..opts.fargs[1]..'}{'..opts.fargs[2]..'}','\\end{'..opts.fargs[1]..'}'},"b",false,true)
	end
	vim.cmd('execute\"normal O\"')
	vim.api.nvim_put({'\t'},"b",false,true)
end,
{nargs = '*'})

vim.api.nvim_create_user_command('Lbei',
function(opts)
	vim.cmd('execute\"normal o\"')
	if opts.fargs[2] == nil  then
		vim.api.nvim_put({'\\begin{'..opts.fargs[1]..'}\t\\end{'..opts.fargs[1]..'}'},"b",false,true)
	else
		vim.api.nvim_put({'\\begin{'..opts.fargs[1]..'}{'..opts.fargs[2]..'}\t\\end{'..opts.fargs[1]..'}'},"b",false,true)
	end
end,
{nargs = '*'})

