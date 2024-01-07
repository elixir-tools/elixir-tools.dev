---
title: "The 2023 elixir-tools Update (Vol. 5)"
permalink: "/news/the-2023-elixir-tools-update-vol-5"
date: 2023-12-26 01:00:00
layout: "ElixirTools.PostLayout"
---

elixir-tools has had an incredible first year!

The amount of support from the community has far exceeded my expectations, and I couldn't be happier. I wanted to wrap up the year sharing the progress that has been made and thank all of our wonderful contributors and sponsors.

There is also a small announcement/surprise at the end 😉.

## Next LS

[Next LS](https://github.com/elixir-tools/next-ls) is the main project from elixir-tools, so the star child gets to go first 😄.

- 11,525 total downloads
    - 2,332 from hex.pm (it switched to GitHub downloads at v0.8)
    - 9,193 from GitHub releases
    - 2,299 downloads of the latest release (v0.15.0)
- 55 releases
- | 20 Contributors                                     |                                                 |                                                 |
  | --------------------------------------------------- | ----------------------------------------------- | ----------------------------------------------- |
  | [NJichev](https://github.com/NJichev)               | [RoboZoom](https://github.com/RoboZoom)         | [aayushmau5](https://github.com/aayushmau5)     |
  | [akirak](https://github.com/akirak)                 | [biletskyy](https://github.com/biletskyy)       | [crbelaus](https://github.com/crbelaus)         |
  | [dvic](https://github.com/dvic)                     | [fhunleth](https://github.com/fhunleth)         | [goofansu](https://github.com/goofansu)         |
  | [ismaelga](https://github.com/ismaelga)             | [jamesvl](https://github.com/jamesvl)           | [jjcarstens](https://github.com/jjcarstens)     |
  | [jozuas](https://github.com/jozuas)                 | [lud-wj](https://github.com/lud-wj)             | [mikayla-maki](https://github.com/mikayla-maki) |
  | [philipgiuliani](https://github.com/philipgiuliani) | [shanesveller](https://github.com/shanesveller) | [stefanluptak](https://github.com/stefanluptak) |
  | [wkirschbaum](https://github.com/wkirschbaum)       | [zachallaun](https://github.com/zachallaun)     |

As of writing, Next LS supports the following features:

- Compiler Diagnostics
- Go To Definition
- Completions
- Find References
- Formatting
- Hover Documentation
- Document Symbols
- Workspace Symbols
- Workspace Folders
- Credo (Extension)

Next LS is also supported in the following editors:

- Emacs
- Helix
- Neovim ([elixir-tools.nvim](https://github.com/elixir-tools/elixir-tools.nvim))
- Vim
- Visual Studio Code ([elixir-tools.vscode](https://github.com/elixir-tools/elixir-tools.vscode))
- Zed

## Tableau

[Tableau](https://github.com/elixir-tools/tableau) is the static site generator that powers this very website!

Tableau has started to become _very_ feature complete this year, supporting most of the essentials you'd expect from any static site generator:

- [x] Good code and browser reloading on file change
- [x] Easy to use the current Node.js JS/CSS tooling
- [x] Extensions
- [ ] Ability to work with "data" (either dynamic data or static files)
    - [x] YAML Files
    - [x] Elixir scripts (.exs files)
- [ ] Handles stuff like Posts, RSS, sitemap, SEO.
    - [x] Posts
    - [x] Pages
    - [x] RSS
    - [x] Sitemap
    - [ ] SEO

Tableau is also very easy to use with any templating language you want! This website is built with [Temple](https://github.com/mhanberg/temple), but you can easily use [EEx](https://github.com/mhanberg/tableau_demo_eex) or even [HEEx](https://github.com/mhanberg/tableau_demo_heex).

If you are migrating from a Jekyll site, you might take advantage of the [solid](https://hex.pm/packages/solid) library for Liquid templates.

I'd also like to give a shoutout to [Leandro Pereira](https://github.com/leandrocp) for the wonderful [MDEx](https://github.com/leandrocp/mdex) library. This markdown library uses a NIF to a rust library that supports the full CommonMark spec and the GitHub Flavored Markdown spec. This is important as it allows an easier migration for blogs and websites built in other frameworks like Jekyll.

Also, a feature that I particularly like, is that it supports syntax highlighting with [tree-sitter](https://tree-sitter.github.io/tree-sitter/), which means we immediately get support for almost every syntax that exists, as well as tons of colorschemes that come from the [Helix](https://github.com/helix-editor/helix) text editor.

Thank you Leandro!

## web_dev_utils

One side effect from building out Tableau, is that I had copy pasted the same utilities into an app for the third time, so I decided to finally make it a package.

[web_dev_utils](https://github.com/elixir-tools/web_dev_utils) is a small package that provides modules for adding asset watchers, file watching, and browser live reloading to your library or framework.

This couldn't have been possible without [Phoenix](https://github.com/phoenixframework/phoenix) laying the foundation, so thank you Phoenix!

## Spitfire

Here's the surprise 🎉.

I am currently building a new error tolerant parser for Elixir that I am code naming "Spitfire".

The driving factor behind this parser is to make it possible to "successfully" parse malformed or incomplete Elixir code, which will allow us to properly query the "environment" of the cursor in a text editor.

This is currently possible for proper/correct Elixir code, but not incomplete code (which occurs more often than complete code when you are in your text editor). This information will eventually allow editor tooling like Next LS to provide accurate and context aware completion candidates, among other features.

This work has been discussed in [elixir-lang/elixir#12645](https://github.com/elixir-lang/elixir/issues/12645#issuecomment-1837629952). You can follow along there or in the Spitfire repo [elixir-tools/spitfire](https://github.com/elixir-tools/spitfire) for updates!

## Community

### Discord

The discord server keeps growing!

We currently have 195 members and are getting more every day, come [join](https://discord.gg/6XdGnxVA2A) the party!

## Thank you

I'd like to give a huge shout out to all of the contributors, bug reporters, and to all of my GitHub sponsors! Without the support of all of you, none of this would be possible.

| Sponsors                                          |                                                   |                                                     |
| ------------------------------------------------- | ------------------------------------------------- | --------------------------------------------------- |
| [akoutmos](https://github.com/akoutmos)           | [andrepaes](https://github.com/andrepaes)         | [baldwindavid](https://github.com/baldwindavid)     |
| [brettwise](https://github.com/brettwise)         | [chriscrabtree](https://github.com/chriscrabtree) | [cigrainger](https://github.com/cigrainger)         |
| [clark-lindsay](https://github.com/clark-lindsay) | [dbernheisel](https://github.com/dbernheisel)     | [dkarter](https://github.com/dkarter)               |
| [dvic](https://github.com/dvic)                   | [dyackson](https://github.com/dyackson)           | [ethangunderson](https://github.com/ethangunderson) |
| [getsupered](https://github.com/getsupered)       | [jlgeering](https://github.com/jlgeering)         | [jwright](https://github.com/jwright)               |
| [kgautreaux](https://github.com/kgautreaux)       | [leonqadirie](https://github.com/leonqadirie)     | [mikl](https://github.com/mikl)                     |
| [Nezteb](https://github.com/Nezteb)               | [NFIBrokerage](https://github.com/NFIBrokerage)   | [oestrich](https://github.com/oestrich)             |
| [PJUllrich](https://github.com/PJUllrich)         | [qdentity](https://github.com/qdentity)           | [RudolfMan](https://github.com/RudolfMan)           |
| [sb8244](https://github.com/sb8244)               | [shenaor](https://github.com/shenaor)             | [simon-wolf](https://github.com/simon-wolf)         |
| [sorenone](https://github.com/sorenone)           | [sorentwo](https://github.com/sorentwo)           | [v1d3rm3](https://github.com/v1d3rm3)               |
| [znorris](https://github.com/znorris)             |

## How to get involved

If you'd like to get involved with elixir-tools, there are several ways:

- Contribute to the project via code on [GitHub](https://github.com/elixir-tools)
- Contribute to the community via [Discord](https://discord.gg/6XdGnxVA2A) or [GitHub](https://github.com/orgs/elixir-tools/discussions)
- Contribute financially via [GitHub Sponsors](https://github.com/sponsors/mhanberg)
