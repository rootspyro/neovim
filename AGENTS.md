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
- LSP (planned): **mason.nvim** + `nvim-lspconfig` — not added yet.
- Leader: `<Space>`; local leader: `\`.

## Structure

- `init.lua` — entry point: enables `vim.loader`, then loads `config.options`,
  bootstraps lazy, then `config.keymaps` / `config.autocmds`.
- `lua/config/*.lua` — core modules, each exposing `M.setup()`.
- `lua/plugins/` — plugin specs by category (create with the first plugin).
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

## Verification

```bash
nvim --headless -c 'qa!' 2>&1                       # loads without errors (exit 0)
nvim --headless -c 'checkhealth' -c 'qa!' 2>&1
nvim --startuptime /tmp/startup.log -c 'qa!' && cat /tmp/startup.log
```

Inside Neovim: `:Lazy`, `:Lazy profile`, `:checkhealth`.
