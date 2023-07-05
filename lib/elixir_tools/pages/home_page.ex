defmodule ElixirTools.HomePage do
  use ElixirTools.Component

  use Tableau.Page,
    layout: ElixirTools.RootLayout,
    permalink: "/"

  import ElixirTools.PostExtension, only: [posts: 1]

  def template(_assigns) do
    temple do
      section id: "home" do
        p do
          "elixir-tools is a suite of developer tooling and packages for Elixir developers."
        end

        p do
          "The elixir-tools effort is lead by"

          a class: "",
            href: "https://github.com/mhanberg",
            do: "Mitchell Hanberg,"

          "please considering sponsoring his work through"

          a class: "",
            href: "https://github.com/sponsors/mhanberg",
            do: "GitHub Sponsors."
        end

        h2 class: "text-xl font-medium mt-4 mb-2", do: "Tools"

        p do
          ul do
            for {tool, href, description} <- tools() do
              li do
                a href: href, do: tool
                span do: "- " <> description
              end
            end
          end
        end

        h2 class: "text-xl font-medium mt-4 mb-2", do: "News"

        p do
          for post <- posts(all: Mix.env() == :dev) do
            ul do
              li do
                a href: post.permalink do
                  post.title
                end
                span do: "(#{Calendar.strftime(post.date, "%Y-%m-%d")})"
              end
            end
          end
        end
      end
    end
  end

  def tools() do
    [
      {"Next LS", "/next-ls", "Language Server Protocol implementation for Elixir"},
      {"Credo Language Server", "https://github.com/elixir-tools/credo-language-server",
       "Langauge Server Protocol implementation for Credo"},
      {"elixir-tools.nvim", "https://github.com/elixir-tools/elixir-tools.nvim",
       "Elixir plugin for Neovim"},
      {"elixir-tools.vscode", "https://github.com/elixir-tools/elixir-tools.vscode",
       "Elixir extension for Visual Studio Code"},
      {"GenLSP", "https://github.com/elixir-tools/gen_lsp",
       "GenLSP is an OTP behaviour for building langauge server protocol implementations"},
      {"Tableau", "https://github.com/elixir-tools/tableau", "Static site generator"}
    ]
  end
end
