---
title: Editors
subtitle: "docs / next-ls"
subtitle_link: "/docs/next-ls/quickstart"
layout: ElixirTools.DocLayout
section: Getting Started
order: 3
github_stars: elixir-tools/next-ls
---

## Visual Studio Code

[elixir-tools.vscode](https://github.com/elixir-tools/elixir-tools.vscode) is a first party elixir-tools editor plugin and will install and manage Next LS for you.

## Neovim

[elixir-tools.nvim](https://github.com/elixir-tools/elixir-tools.nvim) is a first party elixir-tools editor plugin and will install and manage Next LS for you

### Note

If you are using a Neovim distribution like [LunarVim](https://www.lunarvim.org/), [AstroVim](https://astronvim.com/), or [NVChad](https://nvchad.com/), please make sure to disable any Elixir LSP support that comes out of the box, as it will interfere with `elixir-tools.nvim`. 

## Vim

Vim can be configured to run Next LS in conjunction with a few different Vim plugins.

[prabirshrestha/vim-lsp](https://github.com/prabirshrestha/vim-lsp)

Install Next LS somewhere on your PATH, or instead use an absolute path to the Next LS executable.

```vim
if executable('nextls')
  au User lsp_setup call lsp#register_server({
      \ 'name': 'next_ls',
      \ 'cmd': ["nextls", "--stdio"],
      \ 'root_uri':{server_info->lsp#utils#path_to_uri(
      \	lsp#utils#find_nearest_parent_file_directory(
      \		lsp#utils#get_buffer_path(),
      \		['mix.exs']
      \	))},
      \ 'allowlist': ['elixir'],
      \ })
endif
```

---

[yegappan/lsp](https://github.com/yegappan/lsp) - requires Vim 9

Install Next LS somewhere on your PATH, or instead use an absolute path to the Next LS executable.

```vim
let lspServers = [#{
\	  name: 'next_ls',
\	  filetype: ['elixir'],
\	  path: 'nextls',
\	  args: ['--stdio'],
\   rootSearchFiles: ['mix.exs']
\ }]
autocmd VimEnter * call LspAddServer(lspServers)
```

---

[ALE](https://github.com/dense-analysis/ale)

Valid once [https://github.com/dense-analysis/ale/pull/4626](https://github.com/dense-analysis/ale/pull/4626) is merged.

Install Next LS somewhere on your PATH, or instead use an absolute path to the Next LS executable.

```vim
let g:ale_elixir_next_ls_executable = 'path/to/nextls' " optional, if you want to change the executable that is used
let g:ale_linters = {'elixir': ['next_ls']}
```

## Emacs

Emacs can be configured to run Next LS in several flavors of Emacs.

[eglot](https://github.com/joaotavora/eglot)

```elisp
(require 'eglot)

(add-to-list 'exec-path "path/to/next-ls/bin/")

(with-eval-after-load 'eglot
(add-to-list 'eglot-server-programs
   `((elixir-ts-mode heex-ts-mode elixir-mode) .
     ("nextls" "--stdio=true"))))

(add-hook 'elixir-mode-hook 'eglot-ensure)
(add-hook 'elixir-ts-mode-hook 'eglot-ensure)
(add-hook 'heex-ts-mode-hook 'eglot-ensure)
```

---

[Doom Emacs](https://github.com/doomemacs/doomemacs)

1. Install `nextls` somewhere on your `PATH`
2. Enable `lsp` with eglot in `$DOOMDIR/init.el`

```diff
- ;; lsp
+ (lsp +eglot)
```

3. Enable the Elixir layer with lsp in `$DOOMDIR/init.el`

```diff
- ;; elixir
+ (elixir +lsp)
```

4. Configure the eglot client in `$DOOMDIR/config.el`

```elisp
(set-eglot-client! 'elixir-mode '("nextls" "--stdio"))
```

## Helix

Add the following config to your `~/.config/helix/languages.toml`.

```toml
[[language]]
name = "elixir"
scope = "source.elixir"
language-server = { command = "path/to/next-ls", args = ["--stdio=true"] }
```

If you are using the latest git version of helix use this:

```toml
[[language]]
name = "elixir"
scope = "source.elixir"
language-servers = ["nextls"]

[language-server.nextls]
command = "path/to/next-ls"
args = ["--stdio=true"]
```


## Zed

Zed will install and manage Next LS for you.

Add the following settings (tested with [Zed Preview v0.106.2](https://zed.dev/releases/preview)):

```json
{
  "elixir": {
    "lsp": "next_ls"
  }
}
```

