defmodule ElixirTools.HomePage do
  use ElixirTools.Component

  use Tableau.Page,
    layout: ElixirTools.RootLayout,
    permalink: "/"

  import ElixirTools.PostExtension, only: [posts: 1]

  def header(assigns) do
    temple do
      a href: "##{@id}", class: "no-underline" do
        h2 id: @id,
           class: "#{assigns[:class]} hover:after:content-['_#']" do
          slot @inner_block
        end
      end
    end
  end

  def template(assigns) do
    temple do
      section id: "home", class: "prose dark:prose-invert" do
        p do
          "elixir-tools is a suite of developer tooling and packages for Elixir developers."
        end

        p do
          "The elixir-tools effort is lead by"

          a href: "https://github.com/mhanberg",
            do: "Mitchell Hanberg,"

          "please considering sponsoring his work through"

          a href: "https://github.com/sponsors/mhanberg",
            do: "GitHub Sponsors."
        end

        c &header/1, id: "motivation", do: "Motivation"

        p do
          "The goal for elixir-tools is to provide tooling good enough that you'd think they were part of the core language project."
        end

        p do
          "elixir-tools aims to ensure that the Elixir ecosystem has developer tooling of the highest caliber. Many of the languages with high quality tooling have them built in to the core toolchain or are managed by the language itself (Rust, Go)."
        end

        c &header/1, id: "tools", do: "Tools"

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

        c &header/1, id: "news", do: "News"

        p do
          ul do
            for post <- posts(all: Mix.env() == :dev) do
              li do
                a href: post.permalink, do: post.title
                span do: "(#{Calendar.strftime(post.date, "%Y-%m-%d")})"
              end
            end
          end
        end

        c &header/1, id: "sponsors" do
          "Sponsored by"
        end

        div class: "flex flex-col items-center sm:flex-row gap-12" do
          # a href: "https://qdentity.com/", target: "_blank", title: "Qdentity" do
          #   img src: "https://f005.backblazeb2.com/file/elixir-tools/sponsors/qdentity.png",
          #       class: "h-24"
          # end

          a href: "https://www.nfiindustries.com/solutions/integrated-logistics/",
            target: "_blank",
            title: "NFI Integrated Logistics" do
            img src: "https://f005.backblazeb2.com/file/elixir-tools/sponsors/nfi-industries.jpg",
                class: "h-24 rounded"
          end

          a href: "https://www.supered.io",
            target: "_blank",
            title: "Supered" do
            img src: "https://f005.backblazeb2.com/file/elixir-tools/SuperedPink500x500.png",
                class: "h-24 rounded"
          end
        end
      end
    end
  end

  def tools() do
    [
      {"Next LS", "/next-ls", "Language Server Protocol implementation for Elixir"},
      {"Credo Language Server", "https://github.com/elixir-tools/credo-language-server",
       "Language Server Protocol implementation for Credo"},
      {"elixir-tools.nvim", "https://github.com/elixir-tools/elixir-tools.nvim",
       "Elixir plugin for Neovim"},
      {"elixir-tools.vscode", "https://github.com/elixir-tools/elixir-tools.vscode",
       "Elixir extension for Visual Studio Code"},
      {"GenLSP", "https://github.com/elixir-tools/gen_lsp",
       "GenLSP is an OTP behaviour for building language server protocol implementations"},
      {"Tableau", "https://github.com/elixir-tools/tableau", "Static site generator"}
    ]
  end
end
