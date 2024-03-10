---
title: Code Actions
subtitle: "docs / next-ls"
subtitle_link: "/docs/next-ls/code-actions"
layout: ElixirTools.DocLayout
section: Features
order: 4
---

A code action represents a change that can be performed in code, e.g. to fix a problem or to refactor code.


- [Underscore unused variable](#underscore-unused-variable)
- [Require module](#require-module)

## Underscore unused variable

If a variable is unused and the "unused variable" warning is emitted by the compiler, this code action will add the suggested underscore.

## Require module

If a remote macro is used and it hasn't been required, this will insert the appropriate `require SomeModule`.

