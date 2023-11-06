---
id: Docs.NextLS.Formatting
title: Formatting
subtitle: "docs / next-ls"
subtitle_link: "/docs/next-ls/quickstart"
layout: ElixirTools.DocLayout
section: Features
order: 6
github_stars: elixir-tools/next-ls
---

Next LS provides extremely fast code formatting.

It formats your code in it's own Erlang node, so it always respects your formatter configuration and formatter plugins.

You'll never be left with ugly parentheses again!

## Demo

<video src="https://f005.backblazeb2.com/file/elixir-tools/next-ls-code-formatting.mp4" controls></video>

## Caveats

Next LS uses functions introduced in Elixir 1.13 for formatting, so you will experience a degraded experience if your project uses a version less than that.
