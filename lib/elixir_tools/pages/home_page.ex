defmodule ElixirTools.HomePage do
  use ElixirTools.Component

  use Tableau.Page,
    layout: ElixirTools.RootLayout,
    permalink: "/"

  def template(_assigns) do
    temple do
      h1 class: "font-medium text-2xl text-gray-800 py-2" do
        div class: "flex items-center space-x-2" do
          a href: "https://github.com/elixir-tools", class: "hover:underline" do
            img src: "/elixir-tools-no-background.png", class: "h-8 w-8"
          end

          a href: "https://github.com/elixir-tools", class: "hover:underline" do
            "elixir-tools"
          end
        end
      end

      hr class: "mb-8"

      p do
        "elixir-tools is a suite of developer tooling and packages for Elixir developers."
      end

      p class: "mt-8" do
        "The elixir-tools effort is lead by"

        a class: "text-blue-500 hover:underline",
          href: "https://github.com/mhanberg",
          do: "Mitchell Hanberg"

        ", please considering sponsoring his work through"

        a class: "text-blue-500 hover:underline",
          href: "https://github.com/sponsors/mhanberg",
          do: "GitHub Sponsors."
      end

      h2 class: "text-xl font-medium mt-8 mb-2", do: "Tools"

      p do
        ul class: "list-disc ml-4" do
          li do
            a href: "https://github.com/elixir-tools/next-ls",
              class: "text-blue-500 hover:underline" do
              "next-ls"
            end
          end

          li do
            a href: "https://github.com/elixir-tools/credo-language-server",
              class: "text-blue-500 hover:underline" do
              "credo-language-server"
            end
          end

          li do
            a href: "https://github.com/elixir-tools/elixir-tools.nvim",
              class: "text-blue-500 hover:underline" do
              "elixir-tools.nvim"
            end
          end

          li do
            a href: "https://github.com/elixir-tools/elixir-tools.vscode",
              class: "text-blue-500 hover:underline" do
              "elixir-tools.vscode"
            end
          end

          li do
            a href: "https://github.com/elixir-tools/gen_lsp",
              class: "text-blue-500 hover:underline" do
              "gen_lsp"
            end
          end

          li do
            a href: "https://github.com/elixir-tools/tableau",
              class: "text-blue-500 hover:underline" do
              "tableau"
            end
          end
        end
      end
    end
  end
end
