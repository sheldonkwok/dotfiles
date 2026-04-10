# Dotfiles

Personal dotfiles repo for Sheldon Kwok. Configuration files for shell, editor, terminal, and desktop environment tools.

## Repository Structure

```
.
├── Brewfile              # Homebrew packages, casks, and VS Code extensions (macOS)
├── me.zsh                # Personal zsh config: aliases, PATH, env vars (Linux/WSL)
├── zshrc                 # Oh-my-zsh setup sourcing me.zsh and ~/.work.sh
├── .zshrc                # Older zsh config (macOS-era, nvm/rvm/gvm)
├── .bash_aliases         # Legacy bash aliases
├── xbindkeysrc           # X11 keybindings (rofi, spotify, window switching)
├── .xbindkeysrc          # Alternate xbindkeys config
├── iterm2.json           # iTerm2 profile export
├── rofi/                 # Rofi launcher config and themes
├── stock/
│   ├── fish/fish_plugins # Fisher plugin list (fzf, z, nvm, kubectl, ssh-agent)
│   ├── kitty/            # Kitty terminal config + color themes
│   └── nvim/             # Neovim config (LSP, completion, color scheme)
└── stock/cuttings.json   # Misc data
```

## Key Details

- **Editor**: Neovim (aliased as `vi`), using LazyVim. Older LSP config in `stock/nvim/lua/lsp-config.lua`.
- **Shell**: Fish (primary), zsh configs also tracked. Uses starship prompt on macOS.
- **Terminal**: Kitty with FiraCode Nerd Font Mono, hybrid color theme.
- **Tools**: fzf, ripgrep (aliased as `ag`), bat (aliased as `cat`), exa, prettyping, tig, lazygit, delta.
- **Caps Lock** remapped to Escape (`setxkbmap` in me.zsh, `xmodmap` in .bash_aliases).
- **Window switching** via xbindkeys + wmctrl (Alt+Shift+letter for Chrome, Slack, terminal, etc.).

## Gotchas

- `stock/.tmuxline.conf` contains powerline Unicode glyphs (U+E0B0–E0B3). The Read tool strips these characters, so Edit will fail to match lines containing them. Use Python to edit this file instead.

## Conventions

- Commit messages use `feat:` prefix.
- No install/symlink script exists; files are manually linked to their targets.
- `stock/` holds configs that are copied/linked into place (kitty, nvim, fish).
- `~/.work.sh` is sourced but not tracked (work-specific config).
