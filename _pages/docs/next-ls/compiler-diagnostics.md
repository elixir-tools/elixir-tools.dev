---
title: Compiler Diagnostics
subtitle: "docs / next-ls"
subtitle_link: "/docs/next-ls/quickstart"
layout: ElixirTools.DocLayout
section: Features
order: 1
github_stars: elixir-tools/next-ls
---

Next LS provides extremely snappy compiler diagnostics for warnings and errors emitted by the Elixir compiler.

It compiles and loads your code in it's own Erlang node, so it's completely isolated from Next LS's code.

## Demo

<video src="https://f005.backblazeb2.com/file/elixir-tools/next-ls-compiler-diagnostics.mp4" controls></video>

## When are are diagnostics triggered?

Your project is compiled and indexed whenever you save a file, so diagnostics are rendered when your code is finished compiling.
