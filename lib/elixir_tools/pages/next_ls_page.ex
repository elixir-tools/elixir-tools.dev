defmodule ElixirTools.NextLSPage do
  use ElixirTools.Component

  use Tableau.Page,
    layout: ElixirTools.RootLayout,
    permalink: "/next-ls"

  import Temple

  def template(_assigns) do
    temple do
      section class: "max-w-5xl" do
        h2 class: "font-medium text-2xl text-gray-800 py-2 mb-4" do
          "NextLS"
        end

        c &markdown/1,
          text: """
          NextLS is the language server for Elixir that _just works._

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
          _The following screenshots and videos are using [Neovim](https://neovim.io), the [elixir-tools.nvim](https://github.com/elixir-tools/elixir-tools.nvim) plugin, and the [Kanagawa (dragon)](https://github.com/rebelot/kanagawa.nvim) colorscheme._
          """

        h3 class: "font-medium text-xl text-gray-800 py-2" do
          "Features"
        end

        ul class: "list-disc ml-4 mb-4" do
          li do
            a href: "#compiler-diagnostics", class: "text-blue-500 hover:underline" do
              "Compiler Diagnostics"
            end
          end

          li do
            a href: "#code-formatting", class: "text-blue-500 hover:underline" do
              "Code Formatting"
            end
          end

          li do
            a href: "#workspace-symbols", class: "text-blue-500 hover:underline" do
              "Workspace Symbols"
            end
          end

          li do
            a href: "#document-symbols", class: "text-blue-500 hover:underline" do
              "Document Symbols"
            end
          end
        end

        c &feature_header/1,
          title: "Compiler Diagnostics",
          id: "compiler-diagnostics",
          version: "0.1"

        c &markdown/1,
          text: """
          NextLS provides extremely snappy compiler diagnostics for warnings and errors emitted by the Elixir compiler.

          It compiles and loads your code in it's own Erlang node, so it's completely isolated from NextLS's code.
          """

        p class: "max-w-2xl" do
          video src:
                  "https://res.cloudinary.com/mhanberg/video/upload/v1687729279/elixir-tools.dev/next-ls-compiler-diagnostics.mov",
                controls: true
        end

        c &feature_header/1, title: "Code Formatting", id: "code-formatting", version: "0.1"

        c &markdown/1,
          text: """
          NextLS provides extremely fast code formatting.

          It formats your code in it's own Erlang node, so it always respects your formatter configuration and formatter plugins.

          You'll never be left with ugly parentheses again!
          """

        p class: "max-w-2xl" do
          video src:
                  "https://res.cloudinary.com/mhanberg/video/upload/v1687729108/elixir-tools.dev/next-ls-code-formatting.mov",
                controls: true
        end

        c &feature_header/1,
          title: "Workspace Symbols",
          id: "workspace-symbols",
          version: "0.3"

        c &markdown/1,
          text: """
          NextLS can provide symbol lookup for your entire codebase.

          With the click of a few buttons, you can search through all of your modules, functions, macros, and structs!
          """

        p class: "max-w-2xl" do
          video src:
                  "https://res.cloudinary.com/mhanberg/video/upload/v1687728999/elixir-tools.dev/next-ls-workspace-symbols.mp4",
                controls: true
        end

        c &feature_header/1, title: "Document Symbols", id: "document-symbols", version: "0.4"

        c &markdown/1,
          text: """
          Document Symbols are similar to Workspace Symbols, but provide the symbols _only_ for the currently open document.

          They also have an intrinsic hierarchy that makes them useful for seeing the relationship between the document's modules, structs, and functions.

          Below are several common editor features that are powered by Document Symbols.
          """

        h5 id: "document-symbols-breadcrumbs", class: "font-medium text-gray-800 py-2 mb-4" do
          "Breadcrumbs"
        end

        c &markdown/1,
          text: """
          Breadcrumbs are the little "trail" you see at the top of the editor window.
          """

        p class: "max-w-2xl" do
          img src:
                "https://res.cloudinary.com/mhanberg/image/upload/v1688007824/elixir-tools.dev/doc-symbols.png",
              alt: "Demonstration of symbol breadcrumbs of Elixir code, powered by NextLS"
        end

        h5 id: "document-symbols-outline", class: "font-medium text-gray-800 py-2 mb-4" do
          "Outline"
        end

        c &markdown/1,
          text: """
          The outline shows you the hierarchy of the entire document, and allows you to jump to a specific symbol.
          """

        p class: "max-w-2xl" do
          img src:
                "https://res.cloudinary.com/mhanberg/image/upload/v1688007932/elixir-tools.dev/doc-symbols-outilne.png",
              alt: "Demonstration of symbol outline of Elixir code, powered by NextLS"
        end

        h5 id: "document-symbols-fuzzy-finder", class: "font-medium text-gray-800 py-2 mb-4" do
          "Fuzzy Finding"
        end

        c &markdown/1,
          text: """
          Many editors allow you to "fuzzy find" the document symbols, similarly to how you would search for a file to open.

          This screenshot demonstrates this using the [fzf-lua](https://github.com/ibhagwan/fzf-lua) Neovim plugin.
          """

        p class: "max-w-2xl" do
          img src:
                "https://res.cloudinary.com/mhanberg/image/upload/v1688008012/elixir-tools.dev/doc-symbols-fzf.png",
              alt: "Demonstration of symbol fzf of Elixir code, powered by NextLS"
        end
      end
    end
  end

  def markdown(assigns) do
    temple do
      Earmark.as_html!(@text)
    end
  end

  defp feature_header(assigns) do
    temple do
      div class: "flex justify-between items-center py-2 mb-4" do
        h4 id: @id, class: "font-medium text-lg text-gray-800" do
          @title
        end

        span class: "italic" do
          "Introduced in v#{@version}"
        end
      end
    end
  end
end
