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
- [Create undefined function](#create-undefined-function)
- [Remove debugger expression](#remove-debugger-expression)

## Underscore unused variable

If a variable is unused and the "unused variable" warning is emitted by the compiler, this code action will add the suggested underscore.

<video src="https://f005.backblazeb2.com/file/elixir-tools/underscore-variable-demo.mp4" controls></video>

## Require module

If a remote macro is used and it hasn't been required, this will insert the appropriate `require SomeModule`.

<video src="https://f005.backblazeb2.com/file/elixir-tools/require-module-demo.mp4" controls></video>

## Create undefined function

Creates a new public or private function.

<video src="https://f005.backblazeb2.com/file/elixir-tools/create-undfined-function-demo.mp4" controls></video>

## Remove debugger expression

Credo code action

Removes the expressions that trigger the following checks

- `Credo.Check.Warning.Dbg`
- `Credo.Check.Warning.IExPry`
- `Credo.Check.Warning.IoInspect`
- `Credo.Check.Warning.IoPuts`
- `Credo.Check.Warning.MixEnv`

<video src="https://f005.backblazeb2.com/file/elixir-tools/remove-debugger-demo.mp4" controls></video>

