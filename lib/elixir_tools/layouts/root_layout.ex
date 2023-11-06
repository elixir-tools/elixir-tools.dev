defmodule ElixirTools.RootLayout do
  use ElixirTools.Component
  use Tableau.Layout

  def footer(assigns) do
    temple do
      footer id: "footer",
             class: "@container text-zinc-950 dark:text-white py-4 border-t-2 border-white z-10 w-full" do
        div class:
              "container mx-auto px-2 grid grid-cols-1 @sm:grid-cols-2 @lg:grid-cols-3 @5xl:grid-cols-4 gap-x-16 gap-y-8" do
          div do
            h4 class: "text-lg font-medium mb-2", do: "Tools"

            ul do
              for tool <- @data["tools"] do
                li do
                  a href: tool["url"], class: "text-zinc-950 dark:text-white hover:underline" do
                    tool["name"]
                  end
                end
              end
            end
          end

          div do
            h4 class: "text-lg font-medium mb-2", do: "Organization"

            ul do
              li do
                a href: "https://www.elixir-tools.dev",
                  class: "text-zinc-950 dark:text-white hover:underline" do
                  "Website"
                end
              end

              li do
                a href: "https://github.com/elixir-tools",
                  class: "text-zinc-950 dark:text-white hover:underline" do
                  "GitHub"
                end
              end

              li do
                a href: "https://twitter.com/elixir_tools",
                  class: "text-zinc-950 dark:text-white hover:underline" do
                  "Twitter"
                end
              end

              li do
                a href: "https://discord.gg/6XdGnxVA2A",
                  class: "text-zinc-950 dark:text-white hover:underline" do
                  "Discord"
                end
              end
            end
          end

          div do
            h4 class: "text-lg font-medium mb-2", do: "Team"

            ul do
              li do
                a href: "https://github.com/sponsors/mhanberg",
                  class: "text-zinc-950 dark:text-white hover:underline" do
                  "Mitchell Hanberg"
                end
              end
            end
          end

          div do
            h4 class: "text-lg font-medium mb-2", do: "Site"

            ul do
              li do
                a href: "/feed.xml", class: "text-zinc-950 dark:text-white hover:underline" do
                  "RSS"
                end
              end

              li do
                a href: "https://github.com/elixir-tools/elixir-tools.dev",
                  class: "text-zinc-950 dark:text-white hover:underline" do
                  "Source Code"
                end
              end

              li class: "italic text-sm mt-2" do
                span do: "Built with"

                a class: "underline",
                  href: "https://github.com/elixir-tools/tableau",
                  do: "Tableau,"

                a class: "underline",
                  href: "https://tailwindcss.com",
                  do: "TailwindCSS,"

                " and"

                span class: "text-red-500", do: "♥"
              end
            end
          end
        end
      end
    end
  end

  def template(assigns) do
    temple do
      "<!DOCTYPE html>"

      html lang: "en", class: "text-[18px] scroll-p-[120px]" do
        head do
          meta charset: "utf-8"
          meta http_equiv: "X-UA-Compatible", content: "IE=edge"
          meta name: "viewport", content: "width=device-width, initial-scale=1.0"

          if Mix.env() == :prod do
            script defer: true, data_domain: "elixir-tools.dev", src: "/js/foo.js"
          end

          title do
            [@page[:title], "elixir-tools"]
            |> Enum.filter(& &1)
            |> Enum.intersperse("|")
            |> Enum.join(" ")
          end

          link rel: "stylesheet", href: "/css/site.css"
        end

        body class:
               "font-sans dark:bg-gradient-to-br dark:from-zinc-950 dark:via-zinc-900 dark:bg-zinc-900 dark:text-white" do
          div id: "the-universe" do
            header class:
                     "top-0 sticky z-10 w-full bg-white dark:bg-zinc-900 mx-auto p-2 border-b-2 border-white" do
              section class: "container flex justify-between items-center mx-auto py-2" do
                div class: "flex items-center space-x-2" do
                  a href: "/", class: "hover:underline" do
                    img src: "/elixir-tools-no-background.png", class: "h-8 w-8"
                  end

                  h1 class: "font-semibold text-gray-800 dark:text-white text-base lg:text-2xl " do
                    a href: "/", class: "no-underline hover:underline" do
                      "elixir-tools"
                    end

                    if @page[:subtitle] do
                      span do: "/"

                      if @page[:subtitle_link] do
                        a href: @page[:subtitle_link], class: "no-underline hover:underline" do
                          @page[:subtitle]
                        end
                      else
                        span do: @page[:subtitle]
                      end
                    end
                  end
                end

                div class: "flex flex-col-reverse md:flex-row items-center gap-2" do
                  if @page[:github_stars] do
                    a class: "github-button",
                      href: "https://github.com/#{@page.github_stars}",
                      data_size: "large",
                      data_show_count: "true",
                      aria_label: "Star #{@page.github_stars} on GitHub" do
                      "Star"
                    end
                  end

                  if String.starts_with?(@page.permalink, "/docs") do
                    button class: "block lg:hidden",
                           type: "button",
                           onclick: "sidebar.classList.toggle('hidden')" do
                      svg xmlns: "http://www.w3.org/2000/svg",
                          fill: "none",
                          viewbox: "0 0 24 24",
                          stroke_width: "1.5",
                          stroke: "currentColor",
                          class: "w-6 h-6" do
                        path stroke_linecap: "round",
                             stroke_linejoin: "round",
                             d: "M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" do
                        end
                      end
                    end
                  end
                end
              end
            end

            div class: "h-full" do
              render(@inner_content)
            end

            if not String.starts_with?(@page.permalink, "/docs") do
              c &footer/1, data: @data
            end

            if Mix.env() == :dev do
              c &Tableau.live_reload/1
            end

            script async: true, defer: true, src: "https://buttons.github.io/buttons.js"
          end
        end
      end
    end
  end
end
