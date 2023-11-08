---
title: Document Symbols
subtitle: "docs / next-ls"
subtitle_link: "/docs/next-ls/quickstart"
layout: ElixirTools.DocLayout
section: Features
order: 8
github_stars: elixir-tools/next-ls
---

Document Symbols are similar to Workspace Symbols, but provide the symbols _only_ for the currently open document.

They also have an intrinsic hierarchy that makes them useful for seeing the relationship between the document's modules, structs, and functions.

Below are several common editor features that are powered by Document Symbols.

## Breadcrumbs

Breadcrumbs are the little "trail" you see at the top of the editor window.

![Demonstration of symbol breadcrumbs of Elixir code, powered by Next LS](https://f005.backblazeb2.com/file/elixir-tools/doc-symbols-breadcrumbs.png)

## Document Outline

The outline shows you the hierarchy of the entire document, and allows you to jump to a specific symbol.

![Demonstration of symbol outline of Elixir code, powered by Next LS](https://f005.backblazeb2.com/file/elixir-tools/doc-symbols-outilne.png)

## Fuzzy Finding

Many editors allow you to "fuzzy find" the document symbols, similarly to how you would search for a file to open.

This screenshot demonstrates this using the [fzf-lua](https://github.com/ibhagwan/fzf-lua) Neovim plugin.

![Demonstration of symbol fzf of Elixir code, powered by Next LS](https://f005.backblazeb2.com/file/elixir-tools/doc-symbols-fzf.png)
