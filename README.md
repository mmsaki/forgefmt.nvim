# `forgefmt.nvim` 🔨

Format Solidity files automatically on save or manually via `:ForgeFmt` — powered by `forge fmt`.

### 🚀 Features

* 📄 **Single-file support** – works even without a full Foundry project
* 🔌 **Respects `foundry.toml` project config** – uses `[fmt]` settings from `foundry.toml` if present
* 💡 **LSP-free** – no language server required to format
* ✨ **Autoformat on save** – set it and forget it for `.sol` files
* 🎯 **Manual formatting** – use `:ForgeFmt` anytime

## 📦 Installation

```lua
return {
  "mmsaki/forgefmt.nvim",
  config = function()
    require("forgefmt").setup({
      auto_format = true, -- enable autoformat on save
      -- Support for [`shafu`](https://github.com/shafu0x/shafu-formatter) Requires `shafu` to be available in your `$PATH`.
      -- Shafu formatter support is still in early development and may produce unstable results.
      -- Keep this false unless you want to try shafu
      use_shafu = false,  
    })
  end,
}
```

Or load manually and call the command:

```lua
:ForgeFmt
```

optional re-mappings:

This is NOT a default re-mapping but an example

| Keys | Mode | Description |
|------|------|-------------|
| <kbd>space</kbd> → <kbd>f</kbd> | Normal | Forge Format |

```lua
return {
  "mmsaki/forgefmt.nvim",
  config = function()
    require("forgefmt").setup({
      auto_format = true, -- enable autoformat on save
    })
    vim.keymap.set("n", "<leader>f", ":ForgeFmt<CR>", { desc = "Forge Format" })
  end,
}
```

## 🛠 Usage

* Automatically formats `.sol` files on save (if `auto_format = true`)
* Or trigger manually via `:ForgeFmt`
* Compatible with both standalone Solidity files and Foundry projects

## 🧠 Optional: LSP Integration

You can plug `forgefmt.nvim` into your existing LSP formatting pipeline using a custom formatter hook.

### Example: override `vim.lsp.buf.format()` for Solidity

```lua
vim.api.nvim_create_autocmd("FileType", {
  pattern = "solidity",
  callback = function()
    vim.lsp.buf.format = function()
      require("forgefmt").format()
    end
  end,
})
```
