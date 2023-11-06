---
id: Docs.NextLS.FAQ
title: FAQ
subtitle: "docs / next-ls"
subtitle_link: "/docs/next-ls/quickstart"
layout: ElixirTools.DocLayout
section: Help
date: ~N[2023-11-06 00:00:00]
order: 2
permalink: /docs/next-ls/:title
github_stars: elixir-tools/next-ls
---

## Why a new LSP?

The question is often asked: "Why build something new instead of contributing to the existing solutions?"

I chose to build a new language server from scratch in order to explore new ideas, leverage as much from Elixir core as possible, and move very quickly.

Some choices that Next LS has made that differ from existing solutions:

* All language server protocol mechanisms, datatypes, and transport (stdio, TCP) are built into a separate package: [GenLSP](https://github.com/elixir-tools/gen_lsp)
  * Using a framework that is fully documented and complete with a testing SDK makes it easier to develop for beginner and advanced programmers alike. All of the code in the Next LS code base is about Elixir intellisense and not JSON-RPC or stdio communication

* Relies solely on [Compilation Tracers](https://hexdocs.pm/elixir/Code.html#module-compilation-tracers) and regular AST traversal to build the Symbol/Reference database
  * Relying on Elixir core keeps the code base smaller and easier to reason about. It also allows us to leverage advancements made by the core team more quickly

* SQLite3 for the Symbol/Reference database
  * SQLite3 is extremely fast
  * SQL is very familiar to Elixir developers

* Isolated Project Runtime
  * Next LS starts your project inside its very own node, and talks to it via distributed Erlang. This ensures that Next LS code does not contaminate your project code and show up in your intellisense

* Built into a single executable with [Burrito](https://github.com/burrito-elixir/burrito)
  * A single executable makes it easier to install, upgrade, and distribute
  * Burrito packages an isolated Elixir and OTP into the executable, so it is actually independent from the versions your project uses. This allows Next LS to always use the latest and greatest Elixir and OTP features without conflicting with your project
