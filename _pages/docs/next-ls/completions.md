---
title: Completions
subtitle: "docs / next-ls"
subtitle_link: "/docs/next-ls/quickstart"
layout: ElixirTools.DocLayout
section: Features
order: 5
github_stars: elixir-tools/next-ls
---

Completions are an awesome way to explore and learn a new API, as well as increase your productivity by orders of magnitude.

Completions are a new feature in Next LS, and are currently gated behind an experimental flag in order to protect users from instability. You can toggle it on
if you would like to use it, but if there are bugs, you can toggle it off and await a patch.

To enable completions, you must pass the initialization options to the server. You can find the exact settings for your specific editor on their homepage/README, but in general the shape is:

**NOTE**: When using completions, Next LS will use a bundled archive of Elixir instead of the one found in your `PATH`. **This requires at OTP 25+.**

```lua
{
  experimental = {
    completions = {
      enable = true
    }
  }
}
```

For configurations examples in your editor refer to: [Editors](/docs/next-ls/editors)

## Demo

![Demonstration of function completions with documentation in Next LS](https://f005.backblazeb2.com/file/elixir-tools/next-ls-completions-1.png)

![Demonstration of struct field completions in Next LS](https://f005.backblazeb2.com/file/elixir-tools/next-ls-completions-2.png)

<video src="https://f005.backblazeb2.com/file/elixir-tools/better-completions-demo.mp4" controls></video>

<video src="https://f005.backblazeb2.com/file/elixir-tools/snippets-demo.mp4" controls></video>

## Caveats

Next LS supports auto-completions for the following features:

- [x] Modules
- [x] Global remote functions
- [x] Local functions - if they are above the cursor (will improve later)
- [x] Private functions - if they are above the cursor (will improve later)
- [x] Variables/parameters
- [x] Module attributes
- [x] Structs
- [x] Struct fields
- [x] Bitstring modifiers
- [x] Special forms
- [x] Kernel functions
- [x] Imported functions (eg, `import Foo`)
- [x] Aliased modules (eg, `alias Foo.Bar` or `alias Foo.Bar, as: Baz`)
- [x] Aliased remote functions
- [x] Snippets

New features coming soon!

## Settings

### experimental.completions.enable

Controls if the completions feature is activated.

Default: `false`
