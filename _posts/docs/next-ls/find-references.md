---
id: Docs.NextLS.FindReferences
title: Find References
subtitle: "docs / next-ls"
subtitle_link: "/docs/next-ls/quickstart"
layout: ElixirTools.DocLayout
section: Features
date: DateTime.utc_now()
order: 5
permalink: /docs/next-ls/:title
---

Next LS provides support for Find References.

This allows you to see all usages of a module or function throughout your codebase. It works for your application code as well as references to standard lib and dependencies.

## Demo

<video src="https://f005.backblazeb2.com/file/elixir-tools/next-ls-find-references.mp4" controls></video>

## Caveats

The following checklist indicates which types of symbols can have their references located.

- [x] Modules
- [x] Functions
- [x] Modules (dependency)
- [x] Functions (dependency)
- [x] Variables (dependency)
- [x] Module Attributes (dependency)
- [x] Modules (stdlib)
- [x] Functions (stdlib)
- [ ] Types
