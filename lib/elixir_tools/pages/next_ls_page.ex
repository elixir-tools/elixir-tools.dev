defmodule ElixirTools.NextLSPage do
  use ElixirTools.Component

  use Tableau.Page,
    layout: ElixirTools.RootLayout,
    permalink: "/next-ls"

  import Temple

  def template(_assigns) do
    temple do
      h2 class: "font-medium text-2xl text-gray-800 py-2 mb-4" do
        "NextLS"
      end

      p do
        "NextLS is the language server for Elixir that"
        span class: "italic", do: "just works."
      end

      p do
        "Still in heavy development, but early adopters are encouraged!"
      end

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

      p class: "italic" do
        "The following screenshots and videos are using"
        a href: "https://neovim.io", do: "Neovim"
        "the"
        a href: "https://github.com/elixir-tools/elixir-tools.nvim", do: "elixir-tools.nvim"
        "plugin, and the"
        a href: "https://github.com/rebelot/kanagawa.nvim", do: "Kanagawa (dragon)"
        "colorscheme."
      end

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

      h4 id: "compiler-diagnostics", class: "font-medium text-lg text-gray-800 py-2 mb-4" do
        "Compiler Diagnostics"
      end

      p do
        "NextLS provides extremely snappy compiler diagnostics for warnings and errors emitted by the Elixir compiler."
      end

      p do
        "It compiles and loads your code in it's own Erlang node, so it's completely isolated from NextLS's code."
      end

      p class: "max-w-2xl" do
        video src:
                "https://res.cloudinary.com/mhanberg/video/upload/v1687729279/elixir-tools.dev/next-ls-compiler-diagnostics.mov",
              controls: true
      end

      h4 id: "code-formatting", class: "font-medium text-lg text-gray-800 py-2 mb-4" do
        "Code Formatting"
      end

      p do
        "NextLS provides extremely fast code formatting."
      end

      p do
        "It formats your code in it's own Erlang node, so it always respects your formatter configuration and formatter plugins."
      end

      p do
        "You'll never be left with ugly parentheses again!"
      end

      p class: "max-w-2xl" do
        video src:
                "https://res.cloudinary.com/mhanberg/video/upload/v1687729108/elixir-tools.dev/next-ls-code-formatting.mov",
              controls: true
      end

      h4 id: "workspace-symbols", class: "font-medium text-lg text-gray-800 py-2 mb-4" do
        "Workspace Symbols"
      end

      p do
        "NextLS can provide symbol lookup for your entire codebase."
      end

      p do
        "With the click of a few buttons, you can search through all of your modules, functions, macros, and structs!"
      end

      p class: "max-w-2xl" do
        video src:
                "https://res.cloudinary.com/mhanberg/video/upload/v1687728999/elixir-tools.dev/next-ls-workspace-symbols.mp4",
              controls: true
      end

      h4 id: "document-symbols", class: "font-medium text-lg text-gray-800 py-2 mb-4" do
        "Document Symbols"
      end

      p do
        "Document Symbols are similar to Workspace Symbols, but provide the symbols"
        span class: "italic", do: "only"
        "for the currently open document."
      end

      p do
        ~s|They also have an intrinsic hierarchy that makes the useful for seeing the relationship between the documents modules, structs, and functions.|
      end

      h5 id: "document-symbols-breadcrumbs", class: "font-medium text-gray-800 py-2 mb-4" do
        "Breadcrumbs"
      end

      p do
        ~s|Breadcrumbs are the little "trail" you see at the top of the buffer|
      end

      p class: "max-w-2xl" do
        img src:
              "https://res.cloudinary.com/mhanberg/image/upload/v1688007824/elixir-tools.dev/doc-symbols.png",
            alt: "Demonstration of symbol breadcrumbs of Elixir code, powered by NextLS"
      end

      h5 id: "document-symbols-outline", class: "font-medium text-gray-800 py-2 mb-4" do
        "Outline"
      end

      p do
        ~s|The outline shows you the hierarchy of the entire document, and allows you to jump to a specific symbol.|
      end

      p class: "max-w-2xl" do
        img src:
              "https://res.cloudinary.com/mhanberg/image/upload/v1688007932/elixir-tools.dev/doc-symbols-outilne.png",
            alt: "Demonstration of symbol outline of Elixir code, powered by NextLS"
      end

      h5 id: "document-symbols-fuzzy-finder", class: "font-medium text-gray-800 py-2 mb-4" do
        "Fuzzy Finding"
      end

      p do
        ~s|Many editors allow you to also "fuzzy find" the document symbols, similarly to how you would search for a file to open.|
      end

      p do
        ~s|The screenshot demonstrates this using the|
        a href: "https://github.com/ibhagwan/fzf-lua", target: "_blank", do: "fzf-lua"
        ~s|Neovim plugin.|
      end

      p class: "max-w-2xl" do
        img src:
              "https://res.cloudinary.com/mhanberg/image/upload/v1688008012/elixir-tools.dev/doc-symbols-fzf.png",
            alt: "Demonstration of symbol fzf of Elixir code, powered by NextLS"
      end
    end
  end
end
