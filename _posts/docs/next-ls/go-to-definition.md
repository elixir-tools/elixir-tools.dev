---
id: Docs.NextLS.GoToDefinition
title: Go To Definition
subtitle: "docs / next-ls"
subtitle_link: "/docs/next-ls/quickstart"
layout: ElixirTools.DocLayout
section: Features
date: DateTime.utc_now()
order: 3
permalink: /docs/next-ls/:title
---

Next LS provides the ability to go to the definition of a function, macro, or module!

## Demo

<video src="https://f005.backblazeb2.com/file/elixir-tools/next-ls-goto-definition.mp4" controls></video>

## Caveats

The following checklist indicates which types of symbols can be followed to their definition.

- [x] Modules
- [x] Functions
- [x] Modules (dependency)
- [x] Functions (dependency)
- [x] Variables (dependency)
- [x] Module Attributes (dependency)
- [ ] Modules (stdlib)
- [ ] Functions (stdlib)
- [ ] Types
