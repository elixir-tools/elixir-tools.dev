---
id: Docs.NextLS.Troubleshooting
title: Troubleshooting
subtitle: "docs / next-ls"
subtitle_link: "/docs/next-ls/quickstart"
layout: ElixirTools.DocLayout
section: Help
date: ~N[2023-11-06 00:00:00]
order: 1
permalink: /docs/next-ls/:title
github_stars: elixir-tools/next-ls
---

## Check the logs

When something seems wrong, the first thing you should do is check the logs!


### Visual Studio Code

In Visual Studio Code, the logs are available in the `Output` tab in the bottom panel. You'll want to select `Next LS` from the dropdown in that panel.

### Nvim

In Nvim, there are several ways to check the LSP logs.

If you happen to also have [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) installed, you can run `:LspLog` and it will open a new tab with all of the LSP logs.

This is often hard to read, so I created a plugin called [output-panel.nvim](https://github.com/mhanberg/output-panel.nvim) that closely resembles the Output Panel from Visual Studio Code.

## Is `epmd` running?

`epmd`, or "Erlang Port Mapper Daemon", is used to cluster two Erlang nodes together. Next LS starts a runtime node for your project and communicates with it via clustering.

### Linux/Mac:

```bash
pgrep -fl epmd
```

If `epmd` is not running, you might need to start it or ensure it starts automatically with your system. You can do this by running `epmd -daemon`.

## Ensure `glibc` version is at least 2.34

`glibc` is the C standard library that the ERTS is dynamically linked against, so it must be present on your computer. But, some operating systems are bundled with a version of `glibc` that is too old for the ERTS.

### Linux:

```bash
ldd --version
```

This will show the `glibc` version at the top. Ensure it's 2.34 or higher.

### Mac:

macOS doesn't use `glibc`; it uses the Darwin C Library. Hence, this step is not applicable.

### Windows:

Windows does not use `glibc`. If you're using a subsystem or tool that needs it, ensure it's updated.

## Open Visual Studio Code from the terminal

To ensure that `elixir` is in your `PATH`, open Visual Studio Code from the terminal using the [command-line tools](https://code.visualstudio.com/docs/editor/command-line#_launching-from-command-line).

Next LS will print the path of the `elixir` executable that it finds and will be using to start your runtime node.

## Does it work in TCP mode?

### All Platforms:

Start the language server in TCP mode and connect to it with your editor, as described above.

Both extensions install the Next LS executable to `~/.cache/elixir-tools/nextls/bin/nextls`, so you can start the server with `~/.cache/elixir-tools/nextls/bin/nextls --port 9000`.

## Firewall Interference

Sometimes, the firewall can interfere with `epmd` and each Erlang node's ability to cluster. If you face connection issues, you might try turning off the firewall temporarily to see if it resolves the issue.

This is usually a problem on macOS, as you should see a popup asking if `beam` and `epmd` can accept incoming connections (which you should click "yes").

In future version, we plan to sign and notarize the darwin binaries, which should avoid this popups and make this a non-issue.
