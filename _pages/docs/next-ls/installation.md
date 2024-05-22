---
title: Installation
subtitle: "docs / next-ls"
subtitle_link: "/docs/next-ls/quickstart"
layout: ElixirTools.DocLayout
section: Getting Started
order: 2
github_stars: elixir-tools/next-ls
---

If you are using one of the first party elixir-tools editor extensions/plugins, Next LS will be auto-installed and updated on your behalf, no extra work needed!

If you like to download and manage tools yourself, there are several different ways to acquire Next LS.

## Editor Extension

[elixir-tools.vscode](https://github.com/elixir-tools/elixir-tools.vscode) and [elixir-tools.nvim](https://github.com/elixir-tools/elixir-tools.nvim) are first party editor extensions and will manage the Next LS installation for you. See their respective documentation for more information.

## Homebrew

Next LS can be easily installed using our first party Homebrew Tap.

```sh
brew install elixir-tools/tap/next-ls
```

## Nix

Next LS can be easily installed using our [Nix](https://nixos.org/) flake.

```sh
nix profile install github:elixir-tools/next-ls
```

### Notes

If you run into a `warning: ignoring untrusted substituter 'https://elixir-tools.cachix.org', you are not a trusted user.` message, make sure your user is added to the [`trusted-users`](https://nixos.org/manual/nix/stable/command-ref/conf-file#conf-trusted-users) list.

## Mason.nvim

If you are a [Mason.nvim](https://github.com/williamboman/mason.nvim) user, you can install and update Next LS easily with Mason.

```vim
:MasonInstall nextls
```

## GitHub Releases

If you like to download Next LS straight from the source, you can do so on our GitHub releases.

Releases are named for the OS and CPU for which they run on, so make sure you download the right one, and you can rename it once it is downloaded.

If you use the [gh](https://cli.github.com/) CLI, you can easily download release artifacts like so:

```sh
gh release download v0.22.6 \
  --pattern next_ls_linux_amd64 \
  --output ~/.bin/nextls \
  --clobber \
  --repo elixir-tools/next-ls

chmod +x ~/.bin/nextls
```
