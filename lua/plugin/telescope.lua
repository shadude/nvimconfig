return{
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                              , branch = '0.1.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
		},
		config = function()
			require('telescope').setup{
				pickers = {
					find_files = {
						theme = "ivy"
					},
					buffers = {
						theme = "ivy"
					},
					help_tags = {
						theme = "ivy"
					},
				},
				extensions = {
					fzf = {}
				}
			}
			require('telescope').load_extension('fzf')

			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
			vim.keymap.set('n', '<leader>en', function()
				builtin.find_files{
					cwd = vim.fn.stdpath("config")
				}
			end,{})
			vim.keymap.set('n', '<C-p>', builtin.git_files, {})
			vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
			vim.keymap.set('n', '<leader>ps', function()
				builtin.grep_string({ search = vim.fn.input("Grep > ")});
			end)

		end
	},
}
