---
id: Docs.NextLS.Credo
title: Credo
subtitle: "docs / next-ls"
subtitle_link: "/docs/next-ls/quickstart"
layout: ElixirTools.DocLayout
section: Extensions
date: ~N[2023-11-06 00:00:00]
order: 3
permalink: /docs/next-ls/:title
github_stars: elixir-tools/next-ls
---

Next LS provides a built-in extension for Credo!

This extension currently displays Credo diagnostics in your editor, if it detects Credo in included in your project.

If you _don't_ use Credo, nothing to worry about, it won't impact your experience at all!

Upcoming features will include all of the Code Actions from [Credo Language Server](https://github.com/elixir-tools/credo-language-server).

## Demo

![Demonstration of the Credo extension included with Next LS](https://f005.backblazeb2.com/file/elixir-tools/next-ls-credo-extension.png)

## Settings

### extensions.credo.enable

Controls whether the Credo extension activates.

Default: `true`

### extensions.credo.cli_options

Controls the CLI options used when running Credo on your workspace.

Default: `[]`
