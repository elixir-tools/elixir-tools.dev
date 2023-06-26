defmodule ElixirTools.HomePage do
  use ElixirTools.Component

  use Tableau.Page,
    layout: ElixirTools.RootLayout,
    permalink: "/"

  def template(_assigns) do
    temple do
      p do
        "elixir-tools is a suite of developer tooling and packages for Elixir developers."
      end

      p do
        "The elixir-tools effort is lead by"

        a class: "text-blue-500 hover:underline",
          href: "https://github.com/mhanberg",
          do: "Mitchell Hanberg,"

        "please considering sponsoring his work through"

        a class: "text-blue-500 hover:underline",
          href: "https://github.com/sponsors/mhanberg",
          do: "GitHub Sponsors."
      end

      h2 class: "text-xl font-medium mt-4 mb-2", do: "Tools"

      p do
        ul class: "list-disc ml-4" do
          for {tool, href, description} <- tools() do
            li do
              a href: href, class: "text-blue-500 hover:underline" do
                tool
              end

              span do: "- " <> description
            end
          end
        end
      end

      h2 class: "text-xl font-medium mt-4 mb-2", do: "News"

      p do
        span class: "italic", do: "Coming soon!"
      end
    end
  end

  def tools() do
    [
      {"next-ls", "/next-ls", "Language Server Protocol implementation for Elixir"},
      {"credo-language-server", "https://github.com/elixir-tools/credo-language-server",
       "Langauge Server Protocol implementation for Credo"},
      {"elixir-tools.nvim", "https://github.com/elixir-tools/elixir-tools.nvim",
       "Elixir plugin for Neovim"},
      {"elixir-tools.vscode", "https://github.com/elixir-tools/elixir-tools.vscode",
       "Elixir extension for Visual Studio Code"},
      {"gen_lsp", "https://github.com/elixir-tools/gen_lsp",
       "GenLSP is an OTP behaviour for building langauge server protocol implementations"},
      {"tableau", "https://github.com/elixir-tools/tableau", "Static site generator"}
    ]
  end
end
