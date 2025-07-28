vim.api.nvim_create_user_command("ForgeFmt", function()
  require("forgefmt").format()
end, {
  desc = "Format current Solidity file using forge fmt",
})
