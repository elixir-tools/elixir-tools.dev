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

[ALE](https://github.com/dense-analysis/ale)

Valid once [https://github.com/dense-analysis/ale/pull/4626](https://github.com/dense-analysis/ale/pull/4626) is merged.

Install Next LS somewhere on your PATH, or instead use an absolute path to the Next LS executable.

```vim
let g:ale_elixir_next_ls_executable = 'path/to/nextls' " optional, if you want to change the executable that is used
let g:ale_linters = {'elixir': ['next_ls']}
```

## Emacs

Emacs can be configured to run Next LS in several flavors of Emacs.

### Emacs with Eglot

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

Initialization options can be configured:

```elisp
(with-eval-after-load 'eglot
(add-to-list 'eglot-server-programs
   `((elixir-ts-mode heex-ts-mode elixir-mode) .
     ("nextls" "--stdio=true" :initializationOptions (:experimental (:completions (:enable t)))))))
```

### Emacs with lsp-mode

[lsp-mode](https://github.com/emacs-lsp/lsp-mode)

1. Install `nextls` somewhere on your `PATH`
2. Configure `lsp-mode`

```elisp
(use-package lsp-mode
  :ensure t
  :hook (elixir-ts-mode . lsp)
  :commands lsp)
```

3. Add `nextls` to the `lsp-mode` configuration

```elisp
(with-eval-after-load 'lsp-mode
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection '("nextls" "--stdio" ))
          :multi-root t
          ;; :initialization-options '(:experimental (:completions (:enable t))) ;; Enable the experimental completion mode
          :activation-fn (lsp-activate-on "elixir")
          :server-id 'next-ls)))
```

### Doom Emacs with lsp-mode

[Doom Emacs](https://github.com/doomemacs/doomemacs)

lsp-mode is the default LSP client for Doom.

1. Install `nextls` somewhere on your `PATH`
2. Enable `lsp` with lsp-mode in `$DOOMDIR/init.el`

```diff
- ;; lsp
+ lsp
```

3. Enable the Elixir layer with lsp in `$DOOMDIR/init.el`

```diff
- ;; elixir
+ (elixir +lsp)
```

4. Configure the lsp-mode client in `$DOOMDIR/config.el`

```elisp
(after! lsp-mode
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection '("nextls" "--stdio"))
                    :multi-root t
                    :activation-fn (lsp-activate-on "elixir")
                    :server-id 'next-ls)))
```

### Doom Emacs with Eglot

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
### TCP

Helix supports connecting via TCP using `netcat`. https://github.com/helix-editor/helix/wiki/How-to-install-the-default-language-servers

```toml
[[language]]
name = "elixir"
scope = "source.elixir"
language-server = { command = "nc", args = ["127.0.0.1", "9000"] }
```
If you are using the latest git version of helix use this:

```toml
[language-server.nextls]
command = "nc"
args = ["127.0.0.1", "9000"]
```

### Initialization Options

Initialization options are configured with the `config` key.

```toml
[language-server.nextls]
command = "path/to/next-ls"
args = ["--stdio=true"]
config = { experimental = { completions = { enable = true } } }
```

## Zed

Zed will install and manage Next LS for you.

```json
{
  // how you enable Next LS
  "elixir": {
    "lsp": "next_ls"
  },
  "lsp": {
    // how you configure Next LS, notice the kebab casing
    "next-ls": {
      "initialization_options": {
        "extensions": {
          // example configuring the extensions
          "credo": { "enable": false }
        },
        "experimental": {
          // example configuring the experimental options
          "completions": { "enable": true }
        }
      }
    }
  }
}
```

If you want to run a local version of `next-ls` you can do the following:

```json
"elixir": {
  "lsp": {
    "local": {
      "path": "<PATH TO BINARY>",
      "arguments": ["--stdio"]
    }
  }
},
```

Where `PATH TO BINARY` is a location to a local build, eg. `/Users/user/next-ls/burrito_out/next_ls_darwin_arm64`.
