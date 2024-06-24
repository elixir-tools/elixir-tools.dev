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
            "The elixir-tools effort is led by"

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

                  if tool["docs"] do
                    a href: tool["docs"], do: "(documentation)"
                  end
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
        end

        c &header/1, id: "sponsors", class: "text-2xl mt-16 mb-8" do
          "Sponsored by"
        end

        section class: "prose dark:prose-invert mb-8" do
          p do
            "elixir-tools is sponsored by a number of awesome companies."
          end

          p do
            "If you'd like to see your company's logo on the website, you can sponsor Mitchell Hanberg on "

            a href: "https://github.com/sponsors/mhanberg",
              do: "GitHub Sponsors."
          end
        end

        div class: "bg-zinc-800 dark:bg-zinc-900 p-4 rounded" do
          div class: "flex flex-col flex-wrap items-center sm:flex-row gap-x-24 gap-y-12" do
            for sponsor <- @data["corporate_sponsors"] do
              a href: sponsor["url"],
                target: "_blank",
                class: "no-underline",
                title: sponsor["name"] do
                cond do
                  sponsor["svg"] ->
                    sponsor["svg"]

                  sponsor["image"] ->
                    img src: sponsor["image"],
                        class: "h-16 sm:h-20 rounded object-cover"

                  true ->
                    div class: "text-white text-4xl no-underline" do
                      sponsor["name"]
                    end
                end
              end
            end
          end
        end
      end
    end
  end
end
