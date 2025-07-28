local M = {}

function M.format()
	local filepath = vim.api.nvim_buf_get_name(0)
	vim.fn.jobstart({ "forge", "fmt", filepath }, {
		on_exit = function(_, code)
			if code == 0 then
				vim.cmd("checktime")
				vim.notify("[forgefmt] formatted " .. filepath)
			else
				vim.notify("[forgefmt] failed", vim.log.levels.ERROR)
			end
		end,
	})
end

function M.setup(opts)
	if opts and opts.auto_format then
		vim.api.nvim_create_autocmd("BufWritePost", {
			group = vim.api.nvim_create_augroup("ForgeFmt", { clear = true }),
			pattern = "*.sol",
			callback = M.format,
		})
	end
end

return M
