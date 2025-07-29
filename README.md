# forgefmt.nvim

Auto-formatting Solidity files on save or via `:ForgeFmt` using `forge fmt`.

### 🚀 Features

* 📄 **Formats single files** — no need to set up a full project
* 🔌 **Standalone-friendly** — works without `foundry.toml`
* ⚙️ **Smart config detection** — uses `[fmt]` settings from `foundry.toml` if available
* 💡 **Zero LSP setup required** — works out of the box, no language server needed
* ✨ **Autoformats on save** — just start editing `.sol` files
* 🎯 **Manual control available** — run `:ForgeFmt` anytime for explicit formatting

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
