defmodule ElixirTools.HomePage do
  use ElixirTools.Component

  use Tableau.Page,
    layout: ElixirTools.RootLayout,
    permalink: "/"

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
      main class: "container mx-auto px-2 mt-8 mb-16" do
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
              for tool <- @data["tools"] do
                li do
                  a href: tool["url"], do: tool["name"]
                  span do: "- " <> tool["description"]
                end
              end
            end
          end

          c &header/1, id: "news", do: "News"

          p do
            ul do
              for post <- @posts, String.starts_with?(post.permalink, "/news") do
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
            a href: "https://www.nfiindustries.com/solutions/integrated-logistics/",
              target: "_blank",
              title: "NFI Integrated Logistics" do
              img src:
                    "https://f005.backblazeb2.com/file/elixir-tools/sponsors/nfi-industries.jpg",
                  class: "h-24 rounded"
            end

            a href: "https://www.supered.io",
              target: "_blank",
              title: "Supered" do
              img src: "https://f005.backblazeb2.com/file/elixir-tools/SuperedPink500x500.png",
                  class: "h-24 rounded"
            end

            a href: "https://qdentity.com/", target: "_blank", title: "Qdentity" do
              img src: "https://f005.backblazeb2.com/file/elixir-tools/sponsors/qdentity.png",
                  class: "h-24"
            end
          end
        end
      end
    end
  end
end
