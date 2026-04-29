# one-for-all.nvim

A dark, ten-color Neovim colorscheme designed to feel calm but precise. Teal does the structural work (keywords, types, JSX tags), gray carries the chrome (operators, comments, line numbers), red marks control flow (`return`, `throw`, `import`, `await`, `null`/`undefined`, booleans), and a warm cream lights up literals.

The same palette is used across an entire dev setup — Neovim, Ghostty, tmux — so editor, terminal, and multiplexer all speak the same language.

## Palette

| Name              | Hex       | Role                                           |
| ----------------- | --------- | ---------------------------------------------- |
| `eerie_black`     | `#1b1b1b` | editor background                              |
| `jet`             | `#2c2c2c` | float / picker / status background, cursorline |
| `seasalt`         | `#fafafa` | identifiers, functions, default text           |
| `cadet_gray`      | `#abacaf` | properties, fields, JSX attributes             |
| `gray`            | `#777777` | operators, punctuation, comments               |
| `light_sea_green` | `#40bebd` | keywords, types, tags, accent UI               |
| `ecru`            | `#ada159` | strings, search, warnings                      |
| `eggshell`        | `#f0eada` | numbers, constants, special chars              |
| `auburn`          | `#ae2429` | dim red — diff delete, terminal magenta        |
| `amaranth`        | `#db324d` | errors, control-flow keywords, IncSearch       |

## Installation

### lazy.nvim

```lua
{
  "jdonghia/one-for-all.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function(_, opts)
    require("one-for-all").setup(opts)
    vim.cmd.colorscheme("one-for-all")
  end,
}
```

### packer.nvim

```lua
use({
  "jdonghia/one-for-all.nvim",
  config = function()
    require("one-for-all").setup({})
    vim.cmd.colorscheme("one-for-all")
  end,
})
```

### vim-plug

```vim
Plug 'jdonghia/one-for-all.nvim'

" In init.lua / after/plugin:
" require("one-for-all").setup({})
" vim.cmd.colorscheme("one-for-all")
```

## Configuration

`setup()` is optional — `:colorscheme one-for-all` works on its own. Use `setup` only when you want to override colors or highlight groups.

```lua
require("one-for-all").setup({
  -- swap individual palette entries
  palette = {
    light_sea_green = "#3cc8c0",
  },

  -- override or extend highlight groups
  -- can be a table or a function that receives the (possibly merged) palette
  overrides = function(p)
    return {
      Comment             = { fg = p.cadet_gray, italic = true },
      ["@keyword.return"] = { fg = p.amaranth, bold = true },
    }
  end,
})
```

Both `palette` and `overrides` are deep-merged on top of the defaults, so you only specify the keys you want to change.

## What's covered

- Core syntax (`Identifier`, `Keyword`, `String`, `Type`, `Function`, `Operator`, `Comment`, …)
- Treesitter (`@variable`, `@property`, `@tag`, `@keyword.return`, `@diff.*`, …)
- LSP semantic tokens (`@lsp.type.*`, `@lsp.typemod.variable.defaultLibrary`)
- Diagnostics + virtual text + underlines
- Diff / git-signs / fugitive
- Telescope and Snacks picker (focused row uses the teal accent)
- NvimTree / Neo-tree / Oil
- Bufferline, lualine fallback, which-key, nvim-notify, indent guides
- Markdown headings, links, code blocks
- Terminal palette (`g:terminal_color_0…15`)

## Companion configs

The same palette carries over to terminal and multiplexer:

- **Ghostty** — drop-in theme file: [`ghostty/.config/ghostty/themes/one-for-all`](https://github.com/jdonghia/dotfiles/blob/master/ghostty/.config/ghostty/themes/one-for-all)
- **tmux** — status bar in jet, accents in `light_sea_green`, session/host segments in inverted teal: [`tmux/one-for-all.conf`](https://github.com/jdonghia/dotfiles/blob/master/tmux/one-for-all.conf)

Both live in [jdonghia/dotfiles](https://github.com/jdonghia/dotfiles).

## License

MIT
