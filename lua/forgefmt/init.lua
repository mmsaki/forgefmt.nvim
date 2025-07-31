local M = {}

M.config = {
  use_shafu = false,
}

function M.format()
  local filepath = vim.api.nvim_buf_get_name(0)
  if filepath == "" or vim.fn.filereadable(filepath) == 0 then
    vim.notify("[forgefmt] invalid file path", vim.log.levels.WARN)
    return
  end

  local filename = vim.fn.fnamemodify(filepath, ":t")
  local lines = string.format("%dL,", vim.api.nvim_buf_line_count(0))
  local bytes = string.format("%dB", vim.fn.getfsize(filepath))

  local cmd = M.config.use_shafu and "shafu" or "forge"
  local args = M.config.use_shafu and { filepath, "--write" }
    or { "fmt", filepath }
  local msg = M.config.use_shafu and "[shafu_formatter]" or "[forgefmt]"

  vim.fn.jobstart({ cmd, unpack(args) }, {
    stdout_buffered = true,
    on_exit = function(_, code)
      if code == 0 then
        vim.cmd("checktime")
        vim.notify(
          string.format('%s "%s" %s %s written', msg, filename, lines, bytes)
        )
      else
        vim.notify(
          string.format('%s failed on "%s"', msg, filename),
          vim.log.levels.ERROR
        )
      end
    end,
  })
end

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})

  if M.config.auto_format then
    vim.api.nvim_create_autocmd("BufWritePost", {
      group = vim.api.nvim_create_augroup("ForgeFmt", { clear = true }),
      pattern = "*.sol",
      callback = M.format,
    })
  end
end

return M
