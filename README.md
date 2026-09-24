# Neovim Configuration

Personal Neovim configuration targeting Neovim 0.12.5 and built with
[lazy.nvim](https://github.com/folke/lazy.nvim).

## Requirements

- Neovim >= 0.12 (tested on 0.12.5)
- git
- A C compiler and `tree-sitter-cli >= 0.26.1` (required to compile parsers)
- Node.js + npm (mason installs `ts_ls`, `html`, `cssls`, `jsonls`, `yamlls` as
  npm packages)
- Go toolchain (for `gopls` in Go projects)
- A Nerd Font (recommended, for icons)
- ripgrep (recommended, for search)
- lazygit (for the in-editor Git UI)

## Installation

1. Back up any existing configuration:

   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   ```

2. Clone this repository:

   ```bash
   git clone git@github.com:rootspyro/neovim.git ~/.config/nvim
   ```

3. Start Neovim. lazy.nvim bootstraps itself and installs plugins on the first
   launch:

   ```bash
   nvim
   ```

## Structure

```
init.lua              Entry point
lua/config/           Core modules (options, keymaps, autocmds, lazy)
lua/plugins/          Plugin specs by category
```

## Appearance

- Colorscheme: [gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim)
  (dark, medium contrast).
- Statusline: [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim),
  global, with branch, diff, diagnostics, filename and cursor position.
- Indentation guides (and the current scope) are drawn by
  [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim).
- Yanked text is briefly highlighted.

## Language support

LSP servers are installed automatically by mason on first launch:

| Language                | LSP server     | Notes                                    |
| ----------------------- | -------------- | ---------------------------------------- |
| Go                      | `gopls`        |                                          |
| Python                  | `basedpyright` | auto-detects a project-root `.venv` (uv) |
| TypeScript / JavaScript | `ts_ls`        |                                          |
| HTML                    | `html`         |                                          |
| CSS                     | `cssls`        |                                          |
| JSON                    | `jsonls`       | schema validation via SchemaStore        |
| YAML                    | `yamlls`       | schema validation via SchemaStore        |
| Markdown                | `marksman`     |                                          |
| Lua                     | `lua_ls`       | for editing this config                  |

JSON and YAML schema validation is powered by
[SchemaStore.nvim](https://github.com/b0o/SchemaStore.nvim), so files like
`package.json`, `tsconfig.json` or GitHub Actions workflows get completion and
diagnostics out of the box.

Diagnostics are shown as virtual text and in a floating window on cursor hold.

Treesitter parsers for these languages and more (Bash, Vim, query, regex, ...)
are installed by `nvim-treesitter`.

### Python

Create the virtual environment at the project root with `uv venv` (`.venv`).
`basedpyright` detects it automatically, so no per-project configuration is
needed.

## Completion

- [blink.cmp](https://github.com/saghen/blink.cmp) provides LSP, path, snippet
  and buffer completions. Accept with `<Enter>`; documentation is shown
  automatically.
- [supermaven-nvim](https://github.com/supermaven-inc/supermaven-nvim) adds
  inline AI suggestions:

  | Key     | Action              |
  | ------- | ------------------- |
  | `<Tab>` | Accept suggestion   |
  | `<C-j>` | Accept next word    |
  | `<C-]>` | Clear suggestion    |

## Formatting and linting

Formatting runs on save and is provided by
[conform.nvim](https://github.com/stevearc/conform.nvim); linting by
[nvim-lint](https://github.com/mfussenegger/nvim-lint). Tools are installed
automatically by mason.

| Language                            | Formatter               | Linter          |
| ----------------------------------- | ----------------------- | --------------- |
| Go                                  | `goimports` + `gofumpt` | `golangci-lint` |
| Python                              | `ruff`                  | `ruff`          |
| TypeScript / JavaScript             | `prettierd`             | `eslint_d`      |
| HTML / CSS / JSON / YAML / Markdown | `prettierd`             |                 |
| Lua                                 | `stylua`                |                 |

Style is **project-first**: formatters read your project configuration
(`pyproject.toml`, `.prettierrc`, `stylua.toml`, ...), so the editor never
overrides project rules.

- Format the current buffer manually with `<leader>cf`.
- `eslint_d` only runs when an ESLint config is present in the project.

## Debugging

Debugging is provided by [nvim-dap](https://github.com/mfussenegger/nvim-dap)
with the [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) panels and
[nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text)
inline values. Debug adapters are installed automatically by mason:

| Language                | Adapter                              |
| ----------------------- | ------------------------------------ |
| Go                      | `delve`                              |
| Python                  | `debugpy`                            |
| TypeScript / JavaScript | `js-debug-adapter` (vscode-js-debug) |

- Python uses mason's `debugpy-adapter` executable; the debugged program runs in
  the project `.venv` (auto-detected, like `basedpyright`).
- Go uses `dlv` (delve) from mason's `bin` directory.
- TypeScript / JavaScript uses the `pwa-node` adapter backed by vscode-js-debug,
  with launch and attach configurations.

### Debug keymaps

| Key          | Action                      |
| ------------ | --------------------------- |
| `<F5>`       | Start / continue            |
| `<F10>`      | Step over                   |
| `<F11>`      | Step into                   |
| `<F12>`      | Step out                    |
| `<leader>b`  | Toggle breakpoint           |
| `<leader>B`  | Conditional breakpoint      |
| `<leader>lp` | Log point                   |
| `<leader>dt` | Debug nearest test (Go/Py)  |
| `<leader>dr` | Open REPL                   |
| `<leader>dl` | Run last session            |
| `<leader>dh` | Hover variable              |
| `<leader>dp` | Preview variable            |
| `<leader>du` | Toggle dap-ui               |

## Keymaps

Leader is `<Space>`; local leader is `\`.

### Windows and navigation

| Key                                   | Action                              |
| ------------------------------------- | ----------------------------------- |
| `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` | Move to window (left/down/up/right) |
| `<leader>vs`                          | Vertical split                      |
| `<leader>vh`                          | Horizontal split                    |
| `<leader>x`                           | Delete buffer and close window      |
| `<C-Left>` / `<C-Right>`              | Decrease / increase width           |
| `<C-Down>` / `<C-Up>`                 | Decrease / increase height          |
| `<Esc>`                               | Clear search highlights             |

### Files and search

| Key          | Action                                  |
| ------------ | --------------------------------------- |
| `<leader>ff` | Find files (Telescope)                  |
| `<leader>fg` | Live grep in file contents (Telescope)  |
| `<leader>fb` | Open buffers (Telescope)                |
| `<leader>n`  | Native file explorer (netrw, tree view) |

Telescope is lazy-loaded and uses the native `fzf` sorter. `find_files` and
`live_grep` use `ripgrep` and respect `.gitignore`.

### Editing

| Key          | Action                                 |
| ------------ | -------------------------------------- |
| `<leader>lc` | Toggle comment on the current line     |
| `<leader>vc` | Toggle comment on the visual selection |
| `<leader>cf` | Format the current buffer              |
| `<leader>t`  | Toggle a horizontal terminal           |

Commenting uses Neovim's built-in `gc` operator (no plugin required).

- Auto-closing of brackets and quotes is provided by
  [nvim-autopairs](https://github.com/windwp/nvim-autopairs), with
  treesitter-aware pairing.
- Markdown buffers are rendered in place (headings, lists, code blocks, tables)
  by [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim);
  the underlying text is unchanged, so editing stays plain Markdown.

## Git

| Key          | Action                            |
| ------------ | --------------------------------- |
| `<leader>lg` | Open lazygit in a floating window |

[lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) requires the `lazygit`
binary to be installed and available in `PATH`.

In-editor visual feedback is provided by
[vgit.nvim](https://github.com/tanvirtin/vgit.nvim): gutter signs for
added/changed/deleted lines and inline blame on cursor hold. It is loaded at
startup and exposes no extra keymaps; all Git operations are done through
lazygit.

## Plugin management

| Command         | Description             |
| --------------- | ----------------------- |
| `:Lazy`         | Open the lazy dashboard |
| `:Lazy sync`    | Install missing plugins |
| `:Lazy update`  | Update plugins          |
| `:Lazy profile` | Show startup profiling  |

`lazy-lock.json` is committed to pin plugin versions.

## Development

Check that the configuration loads without errors:

```bash
nvim --headless -c 'qa!' 2>&1
```
