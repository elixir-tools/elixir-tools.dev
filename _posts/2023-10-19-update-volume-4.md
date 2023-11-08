---
title: "The elixir-tools Update Vol. 4"
permalink: "/news/:title"
date: "~N[2023-10-19 01:00:00]"
layout: "ElixirTools.PostLayout"
---

## Corporate Sponsor Update

I want to give a quick thank you to the **third** corporate sponsor of elixir-tools, [Supered](https://www.supered.io)!

You can see all of our corporate sponsor's logos on the home page of [elixir-tools.dev](/#sponsors).

Corporate sponsors are a tremendous help, and take the burden off of individuals. If you can, please talk to your employer about sponsoring!

You can sponsor the project on [GitHub](https://github.com/sponsors/mhanberg).

## Next LS

[Next LS](https://github.com/elixir-tools/next-ls) has had... _another_ tremendous month!

This month has had quite a few bug fixes, some distribution patches, and a couple of very exciting new features!

- ~ 7,000 total downloads (estimated, increase of 2,800 from the last update)
  - v0.13.5 was only a few downloads shy of 1,000 before I published a new version, which I think is a solid enough heuristic to say Next LS has about 1,000 users 🤯.
- 9 releases
- 7 contributors (alphabetical order)
  - [Dmytro Biletskyy](https://github.com/biletskyy)
  - [Frank Hunleth](https://github.com/fhunleth)
  - [Ismael Abreu](https://github.com/ismaelga)
  - [Jon Carstens](https://github.com/jjcarstens)
  - [Juozas Norkus](https://github.com/jozuas)
  - [Stefan Luptak](https://github.com/stefanluptak)
  - [Yejun Su](https://github.com/goofansu)

### Local Variable Definition and References

Dmytro is back again with another enhancement to go to definition and find references, this time for local variables!

This was a tricky problem to solve, as local variables definitions and references are not emitted by the compilation tracers, which are used to fill in the symbol/reference database.

Thanks to some clever usage of `Macro.traverse/4`, we have fast and accurate hopping between local variable definitions and references!

Implemented by [Dmytro Biletskyy](https://github.com/biletskyy)!

### Nix Flake

The Nix flake worked alright on macOS, or so I had thought, but Juozas and Yejun knew better!

The following improvements were made:

- Build with the ERTS provided by Nix rather than downloading from the Burrito CDN. Included an upstream [fix](https://github.com/burrito-elixir/burrito/pull/105) to Burrito.
- Correctly install the burrito'd executable into the bin directory.
- Patch the executable to use the Nix provided glibc.

Implemented by [Juozas Norkus](https://github.com/jozuas) and [Yejun Su](https://github.com/goofansu)!

### Configurable MIX_ENV and MIX_TARGET

Jon added the settings to control the MIX_ENV and MIX_TARGET of the runtime that houses your project code. This is very useful for Nerves projects!

Implemented by [Jon Carstens](https://github.com/jjcarstens)!

### Completions

This is a big one that a lot of people have been waiting for!

With v0.14.0, preliminary support for auto-completions has been released, gated by an experimental flag. The reason for the flag is so that if there is any instability, a user can toggle it off until more patches have been released.

This initial release includes support for the following types of completion candidates:

* Global modules
* Global Structs
* Struct fields
* Remote functions/macros (w/ documentation)
* Special Forms (w/ documentation)
* Bitstring modifiers
* Filesystem paths in strings

Coming soon will be candidates that require lexical environment information, such as local variables, module attributes, imported functions/macros (including Kernel), and aliased modules.

In order to proceed with the above, I will be helping out with implementing the capabilities in elixir-lang core, you can follow [elixir-lang/elixir#12645](https://github.com/elixir-lang/elixir/issues/12645) for more information.

Snippets are another upcoming, completion related feature, but aren't being held up by anything upstream.

This functionality is based on `IEx.Autocomplete`, and I'd like to give a huge thanks to the Elixir core team for providing such a firm foundation for Next LS to base it's implementation on.

## elixir-tools.nvim, elixir-tools.vscode, Vim, Zed, and Doom Emacs

We have gained a ton of new editor support since the last update, including support for the new Rust based, collaborative editor [Zed](https://zed.dev), Vim, and Doom Emacs.

### Nvim

- Installs: Measuring installs is hard for a GitHub based plugin, but I have since started tracking clones using a nifty GitHub Action. You can view the report it generates on the [github-repo-stats](https://raw.githubusercontent.com/elixir-tools/elixir-tools.nvim/github-repo-stats/elixir-tools/elixir-tools.nvim/latest-report/report.pdf) branch.
- 2 releases
- 1 contributor (alphabetical order)
  - [Johannes Richard Levi Dickenson](https://github.com/johannesrld)

### Visual Studio Code

- 1,935 installs (+ ~600 since the last update)
- 3 releases

### Vim

Since the last update, I have managed to get Next LS setup and working with several Vim LSP plugins. Vim doesn't have a builtin LSP client like Nvim does, so you must first install an LSP client plugin.

There is now documentation for getting it started with:

* [prabirshrestha/vim-lsp](https://github.com/prabirshrestha/vim-lsp)
* [yegappan/lsp](https://github.com/yegappan/lsp)
* [dense-analysis/ale](https://github.com/dense-analysis/ale) (Still needs an upstream [PR](https://github.com/dense-analysis/ale/pull/4626) in ALE to be merged, however)

You can view the documentation on how to configure these plugins in the Next LS README or on the [website](https://www.elixir-tools.dev/next-ls#getting-started).

### Doom Emacs

Similarly to Vim, I was able to get Next LS up and running in Doom Emacs using the `eglot` LSP client (the one built into Emacs).

You can view the documentation on how to configure Doom Emacs in the Next LS README or on the [website](https://www.elixir-tools.dev/next-ls#getting-started).

### Zed

[Zed](https://zed.dev) is a hot new Rust based collaborative editor that a lot of folks in the Elixir community have been hyping up and rightfully so!

Luckily for us, the kind folks at Zed integrated Next LS into their editor and you can easily opt into Next LS with a small settings change.

You can view the documentation on how to configure Zed in the Next LS README or on the [website](https://www.elixir-tools.dev/next-ls#getting-started).

## Tableau

[Tableau](https://github.com/elixir-tools/tableau) is the static site generator that powers this very website!

Since the last update, Tableau has gained several new abilities:

- Upstreamed the Post extension from elixir-tools.dev into Tableau
- Upstreamed the RSS extension from elixir-tools.dev into Tableau
- YAML data files are now supported. For example, this website has a `tools.yaml` file that is used in several places to loop through all of the tools and render their descriptions and URLs

An upcoming feature is to support `.exs` files as data files, allowing you to run arbitrary code, like some HTTP requests to fetch some data from an API. Once this feature is done, I should be able to port my [personal website](https://www.mitchellhanberg.com) to Tableau. I read from the Goodreads API in a Ruby script to fill in a "bookshelf" page. This should be much simpler to do with Tableau 😉.

## Community

### Discord

The discord server keeps growing!

We currently have 163 (25 new since the last update) members and are getting more every day, come [join](https://discord.gg/6XdGnxVA2A) the party!

## Thank you

I'd like to give a huge shout out to all of the contributors, bug reporters, and to all (29!) of my GitHub sponsors! Without the support of all of you, none of this would be possible.

## How to get involved

If you'd like to get involved with elixir-tools, there are several ways:

- Contribute to the project via code on [GitHub](https://github.com/elixir-tools)
- Contribute to the community via [Discord](https://discord.gg/6XdGnxVA2A) or [GitHub](https://github.com/orgs/elixir-tools/discussions)
- Contribute financially via [GitHub Sponsors](https://github.com/sponsors/mhanberg)

## Sponsors

- [akoutmos](https://github.com/akoutmos)
- [andrepaes](https://github.com/andrepaes)
- [baldwindavid](https://github.com/baldwindavid)
- [brettwise](https://github.com/brettwise)
- [chriscrabtree](https://github.com/chriscrabtree)
- [cigrainger](https://github.com/cigrainger)
- [clark-lindsay](https://github.com/clark-lindsay)
- [dbernheisel](https://github.com/dbernheisel)
- [dkarter](https://github.com/dkarter)
- [dvic](https://github.com/dvic)
- [dyackson](https://github.com/dyackson)
- [ethangunderson](https://github.com/ethangunderson)
- [getsupered](https://github.com/getsupered)
- [jozuas](https://github.com/jozuas)
- [leonqadirie](https://github.com/leonqadirie)
- [mikl](https://github.com/mikl)
- [Nezteb](https://github.com/Nezteb)
- [NFIBrokerage](https://github.com/NFIBrokerage)
- [oestrich](https://github.com/oestrich)
- [PJUllrich](https://github.com/PJUllrich)
- [qdentity](https://github.com/qdentity)
- [RudolfMan](https://github.com/RudolfMan)
- [sb8244](https://github.com/sb8244)
- [shenaor](https://github.com/shenaor)
- [simon-wolf](https://github.com/simon-wolf)
- [sorenone](https://github.com/sorenone)
- [sorentwo](https://github.com/sorentwo)
- [v1d3rm3](https://github.com/v1d3rm3)
- [zyzyva](https://github.com/zyzyva)
