# forgefmt.nvim

Format Solidity files on save or via `:ForgeFmt` using `forge fmt`.

## Installation

```lua
return {
  "mmsaki/forgefmt.nvim"
}
```

Then call the setup function:

```lua
require("forgefmt").setup({
   auto_format = true,
})
```

or run manually: `:ForgeFmt`

## Usage

- Auto-runs on `*.sol` save

Plugin setup for Lazy.nvim:

```lua
return {
   "mmsaki/forgefmt.nvim",
   config = function()
      local forgefmt = require("forgefmt")
      forgefmt.setup({ auto_format = true })
   end,
}
```
