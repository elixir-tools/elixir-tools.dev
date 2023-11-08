---
title: "The elixir-tools Update Vol. 2"
permalink: "/news/:title"
date: "~N[2023-08-14 01:00:00]"
layout: "ElixirTools.PostLayout"
---

Welcome to Vol. 2 of the elixir-tools update!

## Corporate Sponsor Update

I want to give a quick thank you to the first two corporate sponsors of elixir-tools, [Qdentity](https://qdentity.com/) and [NFI Integrated Logistics](https://www.nfiindustries.com/solutions/integrated-logistics/)!

You can see their logos on the home page of [elixir-tools.dev](/#sponsors).

Corporate sponsors are a tremendous help, and take the burden off of individuals. If you can, please talk to your employer about sponsoring!

You can sponsor the project on [GitHub](https://github.com/sponsors/mhanberg).

## Next LS

[Next LS](https://github.com/elixir-tools/next-ls) has had a tremendous month!

- ~ 2,000 downloads (estimated)
- 16 releases
- 7 contributors (alphabetical order)
  - [Aayush Sahu](https://github.com/aayushmau5)
  - [Cristian Álvarez Belaustegui](https://github.com/crbelaus)
  - [Damir Vandic](https://github.com/dvic)
  - [Ludovic Demblans](https://github.com/lud-wj)
  - [Philip Giuliani](https://github.com/philipgiuliani)
  - [Wilhelm Kirschbaum](https://github.com/wkirschbaum)
  - [Zach Allaun](https://github.com/zachallaun)

## Features

- **Workspace Folders**

  You can now add more folders to your workspace in editors like Visual Studio Code. This will utilize a single Next LS instance, but it will still start isolated environments for each folder.

- **Find References** (by [Cristian Álvarez Belaustegui](https://github.com/crbelaus))

  You can now trigger "Find References" on a reference or a function/module definition and see all the places that it is referenced.

- **Binary Executable**

  Next LS is no longer distributed via `Mix.install/2`.

  Instead, we use [Burrito](https://github.com/burrito-elixir/burrito) to compile binaries for every platform! This brings us closer to having a rock solid experience on every platform, and being able to treat Next LS more like an "app" and not like a library. 

  We can use the latest versions of Elixir and OTP, as they are bundled into the executable.

  It's pre-compiled, so you don't need to compile it on your machine. This was the cause of confusion when your editor would install it for the first time or download an update.

  It's better suited to distribution on package managers like Homebrew, Apt, and [mason.nvim](https://github.com/mason-org/mason-registry/pull/2013).

  I want to give a _**huge**_ thank you to my friend [Digit](https://github.com/doawoo), the author of Burrito. He helped make this all possible and taught me a lot of about Linux, libc, and being an hacker 😎.

- **Helix**

  [Philip Giuliani](https://github.com/philipgiuliani) contributed setup instructions for the [Helix](https://helix-editor.com/) text editor!


## Under the Hood

I'd like to give a small spotlight on one under the hood change.

The original version of the "symbol table" that powers Go To Definition and Workspace Symbols was powered by [DETS](https://erlang.org/doc/man/dets.html).

This worked out alright at first, but ended up being quite unergonomic (is that a word?) and a pain to debug.

Instead, Next LS now uses [SQLite3](https://www.sqlite.org/index.html) via the [exqlite](https://github.com/elixir-sqlite/exqlite) package, which is completely embedded into Next LS, so you don't need to have it installed on your machine.

SQLite3 is super fast and SQL is very familiar to Elixir developers, which makes contributing _much_ easier.

This point is really driven home by the new Find References feature. Cristian was able to implement this feature in more or less a few hours and the change was _**purely**_ additive. The diff of the PR was `+207, -0`.

It think that is is a testament to the abstractions that have been put in place and the familiarity of using SQL.

## Coming Soon

We have a number of features that are currently in progress, but didn't make the deadline for this Update Vol. 2.

- **Credo Extension**

  The second core extension and the first to provide integration with a library, the Credo extension will include all of the same functionality of [Credo Language Server](https://github.com/elixir-tools/credo-language-server).

  [PR](https://github.com/elixir-tools/next-ls/pull/163)

- ** Go To (Dependency) Definition**

  [Damir](https://github.com/dvic) has been working on this enhancement, which allows you to follow a definition of a function/module from a dependency into its source code.

  [PR](https://github.com/elixir-tools/next-ls/pull/171)

- **Hover**

  [Denis Tataurov](https://github.com/sineed) has been working on Hover documentation. The recent change to SQLite3 from DETS has caused Denis quite a few merge conflicts 😅. Sorry Denis!

  [PR](https://github.com/elixir-tools/next-ls/pull/104)

## elixir-tools.nvim and elixir-tools.vscode

This month most of the updates for the editor plugins were to support new features in Next LS!

### Download pre-built binaries

Both Nvim and Visual Studio Code will automatically download the correct binary for your operating system and architecture.

### Nvim

- ~ 3,000 clones (estimated, since last update)
- 6 releases
- 2 contributors (alphabetical order)
  - [Andrew Moore](https://github.com/lessthanseventy)
  - [Dorian Karter](https://github.com/dkarter)

### Visual Studio Code

- 932 installs
- 5 releases
- 2 contributors (alphabetical order)
  - [Denis Tataurov](https://github.com/sineed)
  - [Zach Allaun](https://github.com/zachallaun)

## Community

### Discord

The Discord server has been quite lively lately!

We currently have 108 members and are getting more every day, come [join](https://discord.gg/6XdGnxVA2A) the party!

### Denver Erlang and Elixir Meetup

This month of had the pleasure of being invited to talk at the Denver Erlang and Elixir meetup by [Micheal Lubas](https://twitter.com/paraxialio).

There were about 25 people there and I had a ton of fun, you can watch the presentation on [YouTube](https://www.youtube.com/watch?v=_C7-bZqhv-w)!

## Thank you

I'd like to give a huge shout out to all of the contributors, bug reporters, and to all (26!) of my GitHub sponsors! Without the support of all of you, none of this would be possible.

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
- [chriscrabtree](https://github.com/chriscrabtree)
- [cigrainger](https://github.com/cigrainger)
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
- [qdentity](https://github.com/qdentity)
- [RudolfMan](https://github.com/RudolfMan)
- [shenaor](https://github.com/shenaor)
- [simon-wolf](https://github.com/simon-wolf)
- [sorenone](https://github.com/sorenone)
- [sorentwo](https://github.com/sorentwo)
- [zyzyva](https://github.com/zyzyva)

---

I'll see you next month with another update!
