defmodule ElixirTools.NextLSPage do
  use ElixirTools.Component

  use Tableau.Page,
    layout: ElixirTools.RootLayout,
    permalink: "/next-ls",
    extra: [
      github_stars: "elixir-tools/next-ls"
    ]

  import Temple

  def template(_assigns) do
    temple do
      section id: "next-ls", class: "max-w-5xl" do
        h2 class: "font-medium text-2xl text-gray-800 dark:text-white py-2 mb-4" do
          "Next LS"
        end

        c &markdown/1,
          text: """
          Next LS is the language server for Elixir that _just works._

          Still in heavy development, but early adopters are encouraged!

          GitHub: [https://github.com/elixir-tools/next-ls](https://github.com/elixir-tools/next-ls)

          ### Table of Contents

          * [Features](#features)
          * [Getting Started](#getting-started)
          * [FAQ](#faq)
          """

        a href: "#features",
          class: "flex justify-between items-center py-2 mb-4 no-underline" do
          h3 id: "features",
             class:
               "font-medium text-xl text-gray-800 dark:text-white py-2 mt-4 hover:after:content-['_#']" do
            "Features"
          end
        end

        c &markdown/1,
          text: """
          - [Compiler Diagnostics](#compiler-diagnostics)
          - [Code Formatting](#code-formatting)
          - [Workspace Symbols](#workspace-symbols)
          - [Document Symbols](#document-symbols)
          - [Go To Definition](#definition)
          - [Workspace Folders](#workspace-folders)
          - [Pre-built Binaries](#binaries)
          - [Find References](#find-references)
          - [Credo Extension](#credo-extension)
          - [Hover](#hover)
          """

        c &feature_header/1,
          title: "Compiler Diagnostics",
          id: "compiler-diagnostics",
          version: "0.1"

        c &markdown/1,
          text: """
          Next LS provides extremely snappy compiler diagnostics for warnings and errors emitted by the Elixir compiler.

          It compiles and loads your code in it's own Erlang node, so it's completely isolated from Next LS's code.
          """

        p class: "max-w-2xl" do
          video src:
                  "https://f005.backblazeb2.com/file/elixir-tools/next-ls-compiler-diagnostics.mp4",
                controls: true
        end

        c &feature_header/1, title: "Code Formatting", id: "code-formatting", version: "0.1"

        c &markdown/1,
          text: """
          Next LS provides extremely fast code formatting.

          It formats your code in it's own Erlang node, so it always respects your formatter configuration and formatter plugins.

          You'll never be left with ugly parentheses again!
          """

        p class: "max-w-2xl" do
          video src: "https://f005.backblazeb2.com/file/elixir-tools/next-ls-code-formatting.mp4",
                controls: true
        end

        c &feature_header/1,
          title: "Workspace Symbols",
          id: "workspace-symbols",
          version: "0.3"

        c &markdown/1,
          text: """
          Next LS can provide symbol lookup for your entire codebase.

          With the click of a few buttons, you can search through all of your modules, functions, macros, and structs!
          """

        p class: "max-w-2xl" do
          video src:
                  "https://f005.backblazeb2.com/file/elixir-tools/next-ls-workspace-symbols.mp4",
                controls: true
        end

        c &feature_header/1, title: "Document Symbols", id: "document-symbols", version: "0.4"

        c &markdown/1,
          text: """
          Document Symbols are similar to Workspace Symbols, but provide the symbols _only_ for the currently open document.

          They also have an intrinsic hierarchy that makes them useful for seeing the relationship between the document's modules, structs, and functions.

          Below are several common editor features that are powered by Document Symbols.
          """

        h5 id: "document-symbols-breadcrumbs",
           class: "font-medium text-gray-800 dark:text-white py-2 mb-4" do
          "Breadcrumbs"
        end

        c &markdown/1,
          text: """
          Breadcrumbs are the little "trail" you see at the top of the editor window.
          """

        p class: "max-w-2xl" do
          img src: "https://f005.backblazeb2.com/file/elixir-tools/doc-symbols-breadcrumbs.png",
              alt: "Demonstration of symbol breadcrumbs of Elixir code, powered by Next LS"
        end

        h5 id: "document-symbols-outline",
           class: "font-medium text-gray-800 dark:text-white py-2 mb-4" do
          "Outline"
        end

        c &markdown/1,
          text: """
          The outline shows you the hierarchy of the entire document, and allows you to jump to a specific symbol.
          """

        p class: "max-w-2xl" do
          img src: "https://f005.backblazeb2.com/file/elixir-tools/doc-symbols-outilne.png",
              alt: "Demonstration of symbol outline of Elixir code, powered by Next LS"
        end

        h5 id: "document-symbols-fuzzy-finder",
           class: "font-medium text-gray-800 dark:text-white py-2 mb-4" do
          "Fuzzy Finding"
        end

        c &markdown/1,
          text: """
          Many editors allow you to "fuzzy find" the document symbols, similarly to how you would search for a file to open.

          This screenshot demonstrates this using the [fzf-lua](https://github.com/ibhagwan/fzf-lua) Neovim plugin.
          """

        p class: "max-w-2xl" do
          img src: "https://f005.backblazeb2.com/file/elixir-tools/doc-symbols-fzf.png",
              alt: "Demonstration of symbol fzf of Elixir code, powered by Next LS"
        end

        c &feature_header/1, title: "Go To Definition", id: "definition", version: "0.5"

        c &markdown/1,
          text: """
          Next LS provides the ability to go to the definition of a function, macro, or module!
          """

        p class: "max-w-2xl" do
          video src: "https://f005.backblazeb2.com/file/elixir-tools/next-ls-goto-definition.mp4",
                controls: true
        end

        c &feature_header/1,
          title: "Workspace Folders",
          id: "workspace-folders",
          version: "0.6"

        c &markdown/1,
          text: """
          Next LS provides support for Workspace Folders.

          Workspace Folders allow your editor to open all of your projects at once, and utilize a single Next LS instance to power all of them!

          You can add and remove workspace folders without restarting the editor.
          """

        p class: "max-w-2xl" do
          video src:
                  "https://f005.backblazeb2.com/file/elixir-tools/next-ls-workspace-folders.mp4",
                controls: true
        end

        c &feature_header/1,
          title: "Pre-built Binaries",
          id: "binaries",
          version: "0.8"

        c &markdown/1,
          text: """
          Next LS provides pre-built binary executables for common operating systems and architectures.

          This is made possible using [Burrito](https://github.com/burrito-elixir/burrito) 🌯.

          Editor extensions will prompt you to install and will download the appropriate binary from our GitHub releases.
          """

        p class: "max-w-2xl" do
          video src:
                  "https://f005.backblazeb2.com/file/elixir-tools/next-ls-prebuilt-binaries.mp4",
                controls: true
        end

        c &feature_header/1,
          title: "Find References",
          id: "find-references",
          version: "0.9"

        c &markdown/1,
          text: """
          Next LS provides support for Find References.

          This allows you to see all usages of a module or function throughout your codebase. It works for your application code as well as references to standard lib and dependencies.
          """

        p class: "max-w-2xl" do
          video src: "https://f005.backblazeb2.com/file/elixir-tools/next-ls-find-references.mp4",
                controls: true
        end

        c &feature_header/1,
          title: "Credo Extension",
          id: "credo-extension",
          version: "0.10"

        c &markdown/1,
          text: """
          Next LS provides a built-in extension for Credo!

          This extension currently displays Credo diagnostics in your editor, if it detects Credo in included in your project.

          If you _don't_ use Credo, nothing to worry about, it won't impact your experience at all!

          Upcoming features will include all of the Code Actions from [Credo Language Server](https://github.com/elixir-tools/credo-language-server).
          """

        p class: "max-w-2xl" do
          img src: "https://f005.backblazeb2.com/file/elixir-tools/next-ls-credo-extension.png",
              alt: "Demonstration of the Credo extension included with Next LS"
        end

        c &feature_header/1,
          title: "Hover",
          id: "hover",
          version: "0.12"

        c &markdown/1,
          text: """
          Next LS has support for showing module and function documentation on hover.

          Not much else to it, enjoy!
          """

        p class: "max-w-2xl mb-4" do
          img src: "https://f005.backblazeb2.com/file/elixir-tools/next-ls-hover.png",
              alt: "Demonstration of showing documentation on hover with Next LS"
        end

        c &markdown/1,
          text: """
          > The screenshots and videos are (mostly) using [Neovim](https://neovim.io), the [elixir-tools.nvim](https://github.com/elixir-tools/elixir-tools.nvim) plugin, and the [Kanagawa (dragon)](https://github.com/rebelot/kanagawa.nvim) colorscheme.
          >
          > Visual Studio Code demonstrations are using the [elixir-tools.vscode](https://github.com/elixir-tools/elixir-tools.vscode) extension.
          """

        hr class: "my-8"

        a href: "#getting-started",
          class: "flex justify-between items-center py-2 mb-4 no-underline" do
          h3 id: "getting-started",
             class:
               "font-medium text-2xl text-gray-800 dark:text-white hover:after:content-['_#']" do
            "Getting Started"
          end
        end

        c &markdown/1,
          text: ~S'''
          ### Editor Support

          * Neovim: [elixir-tools.nvim](https://github.com/elixir-tools/elixir-tools.nvim)
          * VSCode: [elixir-tools.vscode](https://github.com/elixir-tools/elixir-tools.vscode)
          * Emacs - eglot

            ```elisp
            (require 'eglot)

            (add-to-list 'exec-path "path/to/next-ls/bin/")

            (with-eval-after-load 'eglot
            (add-to-list 'eglot-server-programs
                 `((elixir-ts-mode heex-ts-mode elixir-mode) .
                   ("nextls" "--stdio=true"))))

            (add-hook 'elixir-mode-hook 'eglot-ensure)
            (add-hook 'elixir-ts-mode-hook 'eglot-ensure)
            (add-hook 'heex-ts-mode-hook 'eglot-ensure)
            ```
          * Doom Emacs - eglot

            1. Install `nextls` somewhere on your `PATH`
            2. Enable `lsp` with eglot in `$DOOMDIR/init.el`

               ```diff
               - ;; lsp
               + (lsp +eglot)
               ```

            2. Enable the Elixir layer with lsp in `$DOOMDIR/init.el`

               ```diff
               - ;; elixir
               + (elixir +lsp)
               ```

            2. Configure the eglot client in `$DOOMDIR/config.el`

               ```elisp
               (set-eglot-client! 'elixir-mode '("nextls" "--stdio"))
               ```

          * Helix

            Add the following config to your `~/.config/helix/languages.toml`.

            ```toml
            [[language]]
            name = "elixir"
            scope = "source.elixir"
            language-server = { command = "path/to/next-ls", args = ["--stdio=true"] }
            ```

            If you are using the latest git version of helix use this:

            ```toml
            [[language]]
            name = "elixir"
            scope = "source.elixir"
            language-servers = ["nextls"]

            [language-server.nextls]
            command = "path/to/next-ls"
            args = ["--stdio=true"]
            ```

          * Zed

            [Zed](https://zed.dev)

            Add the following settings (tested with [Zed Preview v0.106.2](https://zed.dev/releases/preview)):

            ```json
            {
              "elixir": {
                "lsp": "next_ls"
              }
            }
            ```

          * Vim - prabirshrestha/vim-lsp

            [prabirshrestha/vim-lsp](https://github.com/prabirshrestha/vim-lsp)

            Install Next LS somewhere on your PATH, or instead use an absolute path to the Next LS executable.

            ```vim
            if executable('nextls')
                au User lsp_setup call lsp#register_server({
                    \ 'name': 'next_ls',
                    \ 'cmd': ["nextls", "--stdio"],
                    \ 'root_uri':{server_info->lsp#utils#path_to_uri(
                    \	lsp#utils#find_nearest_parent_file_directory(
                    \		lsp#utils#get_buffer_path(),
                    \		['mix.exs']
                    \	))},
                    \ 'allowlist': ['elixir'],
                    \ })
            endif
            ```

          * Vim - yegappan/lsp

            [yegappan/lsp](https://github.com/yegappan/lsp) - requires Vim 9

            Install Next LS somewhere on your PATH, or instead use an absolute path to the Next LS executable.

            ```vim
            let lspServers = [#{
              \	  name: 'next_ls',
              \	  filetype: ['elixir'],
              \	  path: 'nextls',
              \	  args: ['--stdio'],
              \   rootSearchFiles: ['mix.exs']
              \ }]
            autocmd VimEnter * call LspAddServer(lspServers)
            ```

          * Vim - ALE

            Valid once https://github.com/dense-analysis/ale/pull/4626 is merged.

            [ALE](https://github.com/dense-analysis/ale)

            Install Next LS somewhere on your PATH, or instead use an absolute path to the Next LS executable.

            ```vim
            let g:ale_elixir_next_ls_executable = 'path/to/nextls' " optional, if you want to change the executable that is used
            let g:ale_linters = {'elixir': ['next_ls']}
            ```

          ### Installation

          #### Editor Extensions

          The preferred way to use Next LS is through one of the supported editor extensions.

          The extension will automatically install the latest version of Next LS and will be kept up to date automatically.

          #### Homebrew

          ```bash
          $ brew install elixir-tools/tap/next-ls
          ```

          #### Nix

          ```bash
          $ nix profile install github:elixir-tools/next-ls
          ```

          #### GitHub Releases

          If you need to install Next LS on it's own, you can download the appropriate executable from our [GitHub Releases](https://github.com/elixir-tools/next-ls/releases).

          These executables are created with [Burrito](https://github.com/burrito-elixir/burrito) and are completely standalone, except you'll still need Elixir and OTP installed in order for it to start a runtime for your application code.
          '''

        a href: "#faq",
          class: "flex justify-between items-center py-2 mb-4 no-underline" do
          h3 id: "faq",
             class:
               "font-medium text-xl text-gray-800 dark:text-white py-2 mt-4 hover:after:content-['_#']" do
            "FAQ"
          end
        end

        h4 class: "font-medium text-lg text-gray-800 dark:text-white py-2 mt-4" do
          "Why a new LSP?"
        end

        c &markdown/1,
          text: """
          The question is often asked: "Why build something new instead of contributing to the existing solutions?"

          I chose to build a new language server from scratch in order to explore new ideas, leverage as much from Elixir core as possible, and move very quickly.

          Some choices that Next LS has made that differ from existing solutions:

          * All language server protocol mechanisms, datatypes, and transport (stdio, TCP) are built into a separate package: [GenLSP](https://github.com/elixir-tools/gen_lsp)
            * Using a framework that is fully documented and complete with a testing SDK makes it easier to develop for beginner and advanced programmers alike. All of the code in the Next LS code base is about Elixir intellisense and not JSON-RPC or stdio communication

          * Relies solely on [Compilation Tracers](https://hexdocs.pm/elixir/Code.html#module-compilation-tracers) and regular AST traversal to build the Symbol/Reference database
            * Relying on Elixir core keeps the code base smaller and easier to reason about. It also allows us to leverage advancements made by the core team more quickly

          * SQLite3 for the Symbol/Reference database
            * SQLite3 is extremely fast
            * SQL is very familiar to Elixir developers

          * Isolated Project Runtime
            * Next LS starts your project inside its very own node, and talks to it via distributed Erlang. This ensures that Next LS code does not contaminate your project code and show up in your intellisense

          * Built into a single executable with [Burrito](https://github.com/burrito-elixir/burrito)
            * A single executable makes it easier to install, upgrade, and distribute
            * Burrito packages an isolated Elixir and OTP into the executable, so it is actually independent from the versions your project uses. This allows Next LS to always use the latest and greatest Elixir and OTP features without conflicting with your project
          """
      end
    end
  end

  def markdown(assigns) do
    temple do
      section class: "prose dark:prose-invert" do
        Earmark.as_html!(@text)
      end
    end
  end

  defp feature_header(assigns) do
    temple do
      a href: "##{@id}", class: "flex justify-between items-center py-2 mb-4 no-underline" do
        h4 id: @id,
           class: "font-medium text-lg text-gray-800 dark:text-white hover:after:content-['_#']" do
          @title
        end

        span class: "italic" do
          "Introduced in v#{@version}"
        end
      end
    end
  end
end
