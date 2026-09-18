# AGENTS.md

Personal Neovim configuration (Lua) targeting **Neovim 0.12.5**, versioned at
`~/.config/nvim`.

## Hard rules

- All code, comments, documentation, and commit messages must be **100% English**.
- Commits must follow **Conventional Commits** (`feat:`, `fix:`, `docs:`,
  `refactor:`, `chore:`, ...).
- **Never commit without the user's explicit permission.**
- Keep `README.md` up to date with installation steps and requirements.

## Stack

- Plugin manager: **lazy.nvim**, bootstrapped in `lua/config/lazy.lua`.
- Syntax: **nvim-treesitter** (`main` branch; highlighting enabled via
  `vim.treesitter.start()` in `config.autocmds`).
- LSP: **mason.nvim** + `mason-lspconfig.nvim` + `nvim-lspconfig`, using the
  native `vim.lsp.config()` / `vim.lsp.enable()` API.
- Completion: **blink.cmp**.
- Formatting/linting: **conform.nvim** + **nvim-lint**; formatters and linters
  are installed by `mason-tool-installer.nvim`.
- Leader: `<Space>`; local leader: `\`.

## Structure

- `init.lua` — entry point: enables `vim.loader`, then loads `config.options`,
  bootstraps lazy, then `config.keymaps` / `config.autocmds`.
- `lua/config/*.lua` — core modules, each exposing `M.setup()`.
- `lua/plugins/*.lua` — plugin specs by category: `treesitter`, `lsp`,
  `completion`, `lint-format`, `telescope`.
- `lazy-lock.json` — pins plugin versions and **must be committed**.

## Gotchas

- `.agents/skills/neovim/` is a **generic 82-plugin template**, NOT this config.
  Never treat it as the source of truth; the real config is the `lua/` tree.
- `vim.g.mapleader` must be set before `require("config.lazy")` so lazy
  keymaps bind correctly.
- `lazy-lock.json` pins versions: `:Lazy sync` installs missing plugins but does
  **not** update pinned ones; use `:Lazy update` to bump them.
- Plugin data lives under `stdpath("data")` (`~/.local/share/nvim`), outside the
  repo. Do not add it here.
- `nvim-treesitter` must use the **`main` branch** on Neovim 0.12 (`master` is
  frozen and does not support 0.12). It requires `tree-sitter-cli >= 0.26.1`
  (installed at `~/.local/bin/tree-sitter`) and a C compiler. Parsers install to
  `stdpath("data")/site/parser`.
- The TypeScript server is **`ts_ls`**, not the old `tsserver` (renamed in
  nvim-lspconfig 2.x).
- `require('lspconfig').<server>.setup()` is **deprecated**; configure with
  `vim.lsp.config(name, {...})` and enable with `vim.lsp.enable(name)`.
  `mason-lspconfig` auto-enables installed servers (`automatic_enable`).
- `:Lazy sync` also runs **clean**, deleting plugins removed from `lua/plugins/`.
- Python: `basedpyright` auto-detects a project-root `.venv` (uv convention);
  settings live under `settings.basedpyright`.
- Formatting is **project-first**: conform passes no style options, so
  `pyproject.toml`, `.prettierrc`, `stylua.toml`, etc. take precedence. The
  editor only decides which tool runs and when (format-on-save, `<leader>cf`).
- `eslint_d` only runs when an ESLint config is found (`vim.fs.root`).
- `mason.nvim` prepends its `bin` dir to `PATH`, which is how conform and
  nvim-lint resolve mason-installed tools.
- netrw is an **opt-in package** in Neovim 0.12 (`pack/dist/opt/netrw`). Do not
  add `netrwPlugin` to `disabled_plugins` or `<leader>n` (`:Explore`) breaks.

## Verification

```bash
nvim --headless -c 'qa!' 2>&1                       # loads without errors (exit 0)
nvim --headless -c 'checkhealth' -c 'qa!' 2>&1
nvim --startuptime /tmp/startup.log -c 'qa!' && cat /tmp/startup.log
```

Inside Neovim: `:Lazy`, `:Lazy profile`, `:checkhealth`.
