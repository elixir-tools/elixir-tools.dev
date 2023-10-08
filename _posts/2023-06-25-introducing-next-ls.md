---
:id: "Introducing.NextLS"
:title: "Introducing Next LS and an elixir-tools update"
:permalink: "/news/:title"
:date: "~N[2023-07-05 01:00:00]"
:layout: "ElixirTools.PostLayout"
---

Since the last we've [talked](https://www.mitchellhanberg.com/credo-language-server-and-the-birth-of-elixir-tools/) 78 days ago, a lot has happened. Let's recap!

## Credo Language Server

[Credo Language Server](https://github.com/elixir-tools/credo-language-server) has received a lot of love by users and contributors alike!

- 2,474 downloads
- 11 releases
- 6 contributors (alphabetical order)
  - [Alan Vardy](https://github.com/alanvardy)
  - [Dennis Palmer](https://github.com/CoderDennis)
  - [Kian-Meng Ang](https://github.com/kianmeng)
  - [Manuel Zubieta](https://github.com/iautom8things)
  - [Weslei Juan Novaes Pereira](https://github.com/wesleimp)
  - [Wilhelm Kirschbaum](https://github.com/wkirschbaum)
- Emacs integration through [lsp-mode](https://github.com/emacs-lsp/lsp-mode/pull/4068) by [Wilhelm Kirschbaum](https://github.com/wkirschbaum)
- Emacs manual setup through eglot by [Wilhelm Kirschbaum](https://github.com/wkirschbaum)
- [Helix](https://helix-editor.com/) manual setup instructions
- New [isolated architecture](https://github.com/elixir-tools/credo-language-server/pull/32) that can support more Credo versions and custom and 3rd party checks

## elixir-tools.nvim

The oldest elixir-tools project, [elixir-tools.nvim](https://github.com/elixir-tools/elixir-tools.nvim) is not slowing down!

- ~6,000 clones (guess based on GitHub traffic metrics)
- 10 releases
- 7 contributors (alphabetical order)
  - [Bryan Hunt](https://github.com/binarytemple)
  - [Damir Vandic](https://github.com/dvic)
  - [David Elias](https://github.com/davidelias)
  - [Jacob Swanner](https://github.com/jswanner)
  - [Jordan Elver](https://github.com/jordelver)
  - [Kian-Meng Ang](https://github.com/kianmeng)
  - [Matt Furden](https://github.com/zolrath)
- Major enhancements to our Projectionist support, work started by [Matt Furden](https://github.com/zolrath)
- Major enhancements to the test suite

## elixir-tools.vscode

The baby of the group, [elixir-tools.vscode](https://github.com/elixir-tools/elixir-tools.vscode) got some love, but still has a long way to grow up!

- 451 installs
- 9 releases
- 1 contributor (alphabetical order)
  - [Dennis Palmer](https://github.com/CoderDennis)
- Very grateful for Dennis' work, he setup the entire CI test suite. (the only thing missing are tests! 😆)

## Emacs

As mentioned above, [Wilhelm Kirschbaum](https://github.com/wkirschbaum) has done a tremendous job getting Credo Language Server and Next LS working with Emacs, even contributing an upstream bug fix to [core emacs](https://lists.gnu.org/archive/html/bug-gnu-emacs/2023-06/msg01341.html)!

There are two primary ways to integrate language servers with Emacs, [lsp-mode](https://emacs-lsp.github.io/lsp-mode/) and [eglot](https://joaotavora.github.io/eglot/).

The former is used by distributions like [Spacemacs](https://www.spacemacs.org/) and [Doom Emacs](https://github.com/doomemacs/) and is a user land plugin and the latter lives inside the bleeding edge releases of core Emacs.

Having elixir-tools working with Emacs is no small feat and I am so incredibly grateful for his work, thank you Wilhelm!

## Sublime Text

There hasn't been any public work yet, but a community member has reached out to me about them creating an elixir-tools.sublime plugin for Sublime Text.

The community outreach (inreach?) with the elixir-tools project has far exceeded my expectations, thank you everyone!

## Tableau

[Tableau](https://github.com/elixir-tools/tableau) hasn't been properly introduced yet, so now is the time!

Tableau is a static site generator for Elixir that focuses on simplicity. You can use it with whatever template syntax you want (this website is written with [Temple](https://github.com/mhanberg/temple)) and you can write whatever kind of extensions you'd like.

Tableau has existed for a while, but really got an overhaul when it came time to build https://www.elixir-tools.dev.

The next steps are to upstream the Post and RSS extensions that currently live in the repository for this website, as well as create an SEO extension. Then I can rewrite [my personal website](https://www.mitchellhanberg.com) with it!

## elixir-tools.dev

This website!

[elixir-tools.dev](https://www.elixir-tools.dev) will be the home for elixir-tools news and documentation.

Built with [Tableau](https://github.com/elixir-tools/tableau), [Temple](https://github.com/mhanberg/temple), and hosted on [Netlify](https://www.netlify.com/).

## Discord

The elixir-tools [Discord server](https://discord.gg/6XdGnxVA2A) now has 64 members, and has become a friendly place for folks to chat about Elixir developer tooling.

## Twitter

Nothing special here, for completeness, there is now an elixir-tools [Twitter](https://twitter.com/elixir_tools) account.

## Introducing Next LS

Next LS is the culmination of over a year of programming, conference talks, blog posts, and community building.

Next LS is the language server for Elixir that _just works._

### Current Features

With the release of [v0.5](https://github.com/elixir-tools/next-ls/releases/tag/v0.5.0) (the 15th release!), Next LS supports the following features (with [many more](https://github.com/elixir-tools/next-ls/issues?q=is%3Aopen+is%3Aissue+label%3Aenhancement) on the way!):

- Compiler Diagnostics ([docs](/next-ls#compiler-diagnostics))
- Code Formatting ([docs](/next-ls#code-formatting))
- Workspace Symbols ([docs](/next-ls#workspace-symbols))
- Document Symbols ([docs](/next-ls#document-symbols))
- Go To Definition ([docs](/next-ls#definition))

### Editor Integrations

Next LS is currently supported by the following editors:

- Neovim (via [elixir-tools.nvim](https://github.com/elixir-tools/elixir-tools.nvim))
- Visual Studio Code (via [elixir-tools.vscode](https://github.com/elixir-tools/elixir-tools.vscode))
- Vim (manually via plugins like [CoC](https://github.com/neoclide/coc.nvim) and [ALE](https://github.com/dense-analysis/ale))
- Emacs (manually via [eglot](https://github.com/elixir-tools/next-ls#editor-support))

### Ready for early adopters

The purpose of this announcement is to declare that Next LS is **ready for early adopters!**

Next LS hasn't reached feature parity with [Elixir LS](https://github.com/elixir-lsp/elixir-ls), so I don't expect the majority of Elixir developers to switch just yet. But I believe it has developed enough for those who like to live on the bleeding edge and aren't satisfied with their current experience.

There will be bugs, and the more people that are using it for their daily work, the faster the kinks will iron out and bring more momentum to the project.

If you have ideas for features or want to contribute, feel absolutely free to check out the GitHub repository!

### How to get started

If you would like to try out Next LS, please check out one of the 1st party elixir-tools editor plugins (elixir-tools.nvim and elixir-tools.vscode) or read the [manual setup instructions](https://github.com/elixir-tools/next-ls#editor-support).

With the 1st party integrations, you won't need to install Next LS separately, but when manually setting it up, you will need to download the script that is included in the GitHub release page.

### What is next for Next LS

I will be tackling the following next:

- Hardening the internal symbol table (will improve Workspace Symbols and Go To Definition)
- Find References (basically the inverse of Go To Definition)
- Credo Extension (will pave the way for the Dialyzer, Ecto, Phoenix extensions)
    - effectively deprecates Credo Language Server for those who use Next LS

If you have a feature that you'd like to see sooner, let me know!

## Thank you

I'd like to give a huge shout out to all of the contributors, bug reporters, and to all (22!) of my GitHub sponsors! Without the support of all of you, none of this would be possible.

## How to get involved

If you'd like to get involved with elixir-tools, there are several ways:

- Contribute to the project via code on [GitHub](https://github.com/elixir-tools)
- Contribute to the community via [Discord](https://discord.gg/6XdGnxVA2A) or [GitHub](https://github.com/orgs/elixir-tools/discussions)
- Contribute financially via [GitHub Sponsors](https://github.com/sponsors/mhanberg)

---

I'll see you next month with another update!
