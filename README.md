# forgefmt.nvim

Format Solidity files on save or via `:ForgeFmt` using `forge fmt`.

## Installation

```lua
return {
  "mmsaki/forgefmt.nvim"
}
```
Set up auto formatting:

```lua
return {
  "mmsaki/forgefmt.nvim",
  config = function()
    local forgefmt = require("forgefmt")
    forgefmt.setup({ auto_format = true })
  end,
}
```

## Usage

- Auto-runs on *.sol save
- Run manually: `:ForgeFmt`

```lua
require("forgefmt").setup({
  auto_format = true,
})
```
