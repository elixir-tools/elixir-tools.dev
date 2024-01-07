---
title: "The elixir-tools Update Vol. 3"
permalink: "/news/the-elixir-tools-update-vol-3"
date: 2023-09-19 01:00:00
layout: "ElixirTools.PostLayout"
---

## Next LS

[Next LS](https://github.com/elixir-tools/next-ls) has had _another_ tremendous month!

This month was filled with _boring_ infrastructure improvements as well as some awesome new features.

- ~ 4,200 total downloads (estimated)
- 12 releases
- 5 contributors (alphabetical order)
  - [Damir Vandic](https://github.com/dvic)
  - [Denis Tataurov](https://github.com/sineed)
  - [Dmytro Biletskyy](https://github.com/biletskyy)
  - [Frank Hunleth](https://github.com/fhunleth)
  - [RoboZoom](https://github.com/RoboZoom)

## Auto Update

Next LS now has a built in auto update mechanism!

When Next LS starts up, it will check to see if there is a new version, and if there is, it downloads the appropriate release from GitHub and notifies you to restart your editor when you are ready to use the new version.

The editor extensions set this automatically if you don't configure a custom binary location. If you do, it assumes you are managing it yourself and won't enable the auto update process.

## CLI Improvements

While you don't normally interact with the Next LS CLI, it is still a CLI tool at it's heart.

The CLI now has `--help` and `--version` options that work as you'd expect.

```
Next LS v0.12.5

The language server for Elixir that just works.

     Author: Mitchell Hanberg
  Home page: https://www.elixir-tools.dev/next-ls
Source code: https://github.com/elixir-tools/next-ls

nextls [flags]

FLAGS

  --stdio             Use stdio as the transport mechanism
  --port <port>       Use TCP as the transport mechanism, with the given port
  --help              Show help
  --version           Show nextls version
```

## Symbol/Reference Database Improvements

There has been a few improvements to the symbol/reference database, which powers the Definition and References features, let's take a look!

### Dependency Definitions

You can now follow a module or function definition into a dependency! This is useful if you quickly need to see how a dependencies function was implemented without heading to your web browser or another editor.

Implemented by [Damir Vandic](https://github.com/dvic)!

### Module Attributes

You can now follow a module attribute to its definition or find references of that attribute.

Implemented by [Dmytro Biletskyy](https://github.com/biletskyy)!

### Modules in `alias` calls

Modules that are arguments to the `alias` special form are now added to the references database, so you can use definition, references, and hover on them!

## Credo Extension

We have our very first 1st party extension for a library, [Credo](https://github.com/rrrene/credo)!

The Credo extension currently provides diagnostics for Credo checks. This is a subset of the features from [Credo Language Server](https://github.com/elixir-tools/credo-language-server), and effectively deprecates Credo Langauge Server if you are using Next LS.

Effort to port of the Code Actions is next.

## Indexing notifications

If your code base is sufficiently large (maybe in the 60kloc range), your project might continue to index after it has finished compiling.

Index progress notifications help you know if it's still chugging along or if something is broken.

## Workspace Symbols Improvements

Workspace Symbol queries used to be a basic regex match (internally just `=~`), but now they use a ranked fuzzy match.

This provides matches similar to that of the `fzf` CLI tool.

Implemented by [Dmytro Biletskyy](https://github.com/biletskyy)!

## Infrastructure Improvements

A big portion of this month was setting up a safe, automated pipeline for building and releasing the burrito binaries, along with setting up alternative methods of distribution.

### Release Pipeline

In order for burrito to be able to cross compile to other OSs and architectures, it needs to be run on an Apple Silicon Mac.

I have an M1 MacBook Air, so in the beginning this was fine, but quickly became tedious.

Luckily I have GitHub sponsors (and one very generous one time sponsor!) so I was able to justify the purchase of a refurbished M2 Mac Mini. 

I was able to cobble together the following technologies to achieve a fully automated release pipeline:

- M2 Mac Mini
- [VLAN](https://en.wikipedia.org/wiki/VLAN)
- [release-please](https://github.com/google-github-actions/release-please-action)
- [Self hosted GitHub Actions Runner](https://github.com/actions/runner)
- [Cirrus CLI](https://github.com/cirruslabs/cirrus-cli)
- [Tart VMs](https://github.com/cirruslabs/tart)
- [rtx](https://github.com/jdx/rtx)

So basically the pipeline is:

- Merge code into `main`
- `release-please-action` creates a new GitHub release as a draft
- GitHub Actions kicks off the release job, which is dispatched to the runner that is running on the Mac Mini in my closet.
- The Mac Mini is associated with its own Virtual LAN, so it can't see the rest of my home network.
- The runner runs a private workflow that is stored in a separate repository.
- That workflow starts a Cirrus workflow using the Cirrus CLI. The CLI boots a macOS virtual machine using `tart` and rsyncs the source code to it.
- The `.cirrus.yml` configuration installs `rtx`, which is then used to install the appropriate Elixir and Erlang versions.
- We run `mix release`, which generates the burrito binaries.
- The binaries are then uploaded to the draft GitHub release.
- The release is published! (goes from draft to published)


This workflow seems to be working incredibly well! I opted to self host the Apple Silicon machine because it seemed to be the most cost effective option while still being in the GitHub Actions ecosystem.

Other elixir-tools projects can also use this runner to run tests on Apple Silicon (which is important, as many developers use Apple Silicon).

### Homebrew Tap

Next LS is now available with Homebrew by our self hosted tap. Simply run `brew install elixir-tools/tap/next-ls`!

Currently their are pre-built bottles for amd64 Linux and amd64 macOS. Once I get the tap hooked into the new Mac Mini runner, it should be able to build arm64 macOS bottles as well.

I also still need to get updating the tap automated with the release pipeline.

### Nix Flake

A [nix flake](https://nixos.wiki/wiki/Flakes) is now included in the repository, so you can install it via Nix with `nix profile install github:elixir-tools/next-ls`.

This works on macOS currently, but nix running on NixOS or Linux doesn't seem to work yet. I'm still learning nix!

## elixir-tools.nvim and elixir-tools.vscode

This month most of the updates for the editor plugins were to support new features in Next LS!

### Nvim

- ~ 4,000 clones (estimated, since last update)
- 5 releases
- 2 contributors (alphabetical order)
  - [André Luiz da Fonsêca Paes](https://github.com/andrepaes)
  - [Damir Vandic](https://github.com/dvic)

### Visual Studio Code

- 1,398 installs
- 3 releases
- 1 contributors (alphabetical order)
  - [Zach Allaun](https://github.com/zachallaun)

## Community

### Discord

The discord server keeps growing!

We currently have 138 (30 new since the last update) members and are getting more every day, come [join](https://discord.gg/6XdGnxVA2A) the party!

## Thank you

I'd like to give a huge shout out to all of the contributors, bug reporters, and to all (27!) of my GitHub sponsors! Without the support of all of you, none of this would be possible.

## How to get involved

If you'd like to get involved with elixir-tools, there are several ways:

- Contribute to the project via code on [GitHub](https://github.com/elixir-tools)
- Contribute to the community via [Discord](https://discord.gg/6XdGnxVA2A) or [GitHub](https://github.com/orgs/elixir-tools/discussions)
- Contribute financially via [GitHub Sponsors](https://github.com/sponsors/mhanberg)

## Sponsors

- [aayushmau5](https://github.com/aayushmau5)
- [akoutmos](https://github.com/akoutmos)
- [andrepaes](https://github.com/andrepaes)
- [baldwindavid](https://github.com/baldwindavid)
- [brettwise](https://github.com/brettwise)
- [bus710](https://github.com/bus710)
- [chriscrabtree](https://github.com/chriscrabtree)
- [cigrainger](https://github.com/cigrainger)
- [clark-lindsay](https://github.com/clark-lindsay)
- [dbernheisel](https://github.com/dbernheisel)
- [dkarter](https://github.com/dkarter)
- [dvic](https://github.com/dvic)
- [dyackson](https://github.com/dyackson)
- [ethangunderson](https://github.com/ethangunderson)
- [jozuas](https://github.com/jozuas)
- [leonqadirie](https://github.com/leonqadirie)
- [mikl](https://github.com/mikl)
- [Nezteb](https://github.com/Nezteb)
- [NFIBrokerage](https://github.com/NFIBrokerage)
- [oestrich](https://github.com/oestrich)
- [PJUllrich](https://github.com/PJUllrich)
- [RudolfMan](https://github.com/RudolfMan)
- [shenaor](https://github.com/shenaor)
- [simon-wolf](https://github.com/simon-wolf)
- [sorenone](https://github.com/sorenone)
- [sorentwo](https://github.com/sorentwo)
- [zyzyva](https://github.com/zyzyva)
