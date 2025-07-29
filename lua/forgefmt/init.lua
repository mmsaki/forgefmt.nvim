local M = {}

function M.format()
  local filepath = vim.api.nvim_buf_get_name(0)
  if filepath == "" or vim.fn.filereadable(filepath) == 0 then
    vim.notify("[forgefmt] invalid file path", vim.log.levels.WARN)
    return
  end

  vim.cmd("write")

  vim.fn.jobstart({ "forge", "fmt", filepath }, {
    stdout_buffered = true,
    on_exit = function(_, code)
      local filename = vim.fn.fnamemodify(filepath, ":t")
      local lines = string.format("%dL, ", vim.api.nvim_buf_line_count(0))
      local bytes = string.format("%dB", vim.fn.getfsize(filepath))
      if code == 0 then
        vim.cmd("checktime")
        vim.notify(
          '[forgefmt] "' .. filename .. '" ' .. lines .. bytes .. " witten"
        )
      else
        vim.notify(
          '[forgefmt] failed"' .. filename .. '"',
          vim.log.levels.ERROR
        )
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
