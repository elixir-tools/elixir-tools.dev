defmodule ElixirTools.NextLSPage do
  use ElixirTools.Component

  use Tableau.Page,
    layout: ElixirTools.RootLayout,
    permalink: "/next-ls"

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
          """

        p class: "inline-flex flex-col" do
          span do
            "GitHub:"

            a href: "https://github.com/elixir-tools/next-ls",
              target: "_blank",
              do: "https://github.com/elixir-tools/next-ls"
          end

          span do
            "Hex:"

            a href: "https://hex.pm/packages/next_ls",
              target: "_blank",
              do: "https://hex.pm/packages/next_ls"
          end
        end

        c &markdown/1,
          text: """
          _The following screenshots and videos are (mostly) using [Neovim](https://neovim.io), the [elixir-tools.nvim](https://github.com/elixir-tools/elixir-tools.nvim) plugin, and the [Kanagawa (dragon)](https://github.com/rebelot/kanagawa.nvim) colorscheme._

          _Visual Studio Code demonstrations are using the [elixir-tools.vscode](https://github.com/elixir-tools/elixir-tools.vscode) extension._
          """

        h3 class: "font-medium text-xl text-gray-800 dark:text-white py-2" do
          "Features"
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

        c &markdown/1,
          text: """
          The following still needs to be implemented:

          - [local variables](https://github.com/elixir-tools/next-ls/issues/85)
          - [module attributes](https://github.com/elixir-tools/next-ls/issues/86)
          - [inside `quote` blocks](https://github.com/elixir-tools/next-ls/issues/88)
          - [modules inside alias calls](https://github.com/elixir-tools/next-ls/issues/89)
          - [inside test files](https://github.com/elixir-tools/next-ls/issues/90)
          """

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
