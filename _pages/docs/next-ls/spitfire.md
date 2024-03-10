---
title: Spitfire
subtitle: "docs / next-ls"
subtitle_link: "/docs/next-ls/spitfire"
layout: ElixirTools.DocLayout
section: Features
order: 11
github_stars: elixir-tools/next-ls
---

## Spitfire

[Spitfire](https://github.com/elixir-tools/spitfire) is a new parser for Elixir source code. Unlike the existing parser, it can tolerate errors in the source code and still provide an AST.

Next LS has support to use Spitfire internally instead of `Code.string_to_quoted` for features that use AST traversal like [Document Symbols](/docs/next-ls/document-symbols).

An advantage to using it is that the feature will still work even if you're source code has errors because you are in the middle of editing it.

### Usage

To enable Spitfire, you need to start the LSP with the environment variable `NEXTLS_SPITFIRE_ENABLED=1`.

If you are using [elixir-tools.nvim](https://github.com/elixir-tools/elixir-tools.nvim) or [elixir-tools.vscode](https://github.com/elixir-tools/elixir-tools.vscode), there will be plugin specific settings to take care of this for you.

If you are using an editor with more manual setup like Helix, you will need to configure the variable yourself.

### Caution

Spitfire is still experimental, so please report any errors you find!
