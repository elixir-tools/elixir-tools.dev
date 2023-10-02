defmodule ElixirTools.RootLayout do
  use ElixirTools.Component
  use Tableau.Layout

  def template(assigns) do
    temple do
      "<!DOCTYPE html>"

      html lang: "en", class: "text-[18px]" do
        head do
          meta charset: "utf-8"
          meta http_equiv: "X-UA-Compatible", content: "IE=edge"
          meta name: "viewport", content: "width=device-width, initial-scale=1.0"

          if Mix.env() == :prod do
            script defer: true, data_domain: "elixir-tools.dev", src: "/js/foo.js"
          end

          title do: "elixir-tools"

          link rel: "stylesheet", href: "/css/site.css"
        end

        body class:
               "font-sans dark:bg-gradient-to-br dark:from-zinc-950 dark:via-zinc-900 dark:bg-zinc-900 dark:text-white" do
          div id: "the-universe" do
            header class: "top-0 sticky w-full bg-white dark:bg-zinc-900 mx-auto p-2 mb-8 border-b-2 border-white" do
              section class: "container flex justify-between items-center mx-auto py-2" do
                div class: "flex items-center space-x-2" do
                  a href: "/", class: "hover:underline" do
                    img src: "/elixir-tools-no-background.png", class: "h-8 w-8"
                  end

                  h1 do
                    a href: "/",
                      class: "font-medium text-2xl text-gray-800 dark:text-white hover:underline" do
                      "elixir-tools"
                    end
                  end
                end

                if @inner_content == [ElixirTools.NextLSPage] do
                  a class: "github-button",
                    href: "https://github.com/elixir-tools/next-ls",
                    data_size: "large",
                    data_show_count: "true",
                    aria_label: "Star elixir-tools/next-ls on GitHub" do
                    "Star"
                  end
                end
              end
            end

            main class: "container mx-auto px-2" do
              render(@inner_content)
            end

            footer class: "bg-zinc-900 text-white mt-16 py-4 " do
              div class:
                    "container mx-auto px-2 grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-x-16 gap-y-8" do
                div do
                  h4 class: "text-lg font-medium mb-2", do: "Tools"

                  ul do
                    for {tool, href, _} <- ElixirTools.HomePage.tools() do
                      li do
                        a href: href, class: "text-white hover:underline" do
                          tool
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
                        class: "text-white hover:underline" do
                        "Website"
                      end
                    end

                    li do
                      a href: "https://github.com/elixir-tools",
                        class: "text-white hover:underline" do
                        "GitHub"
                      end
                    end

                    li do
                      a href: "https://twitter.com/elixir_tools",
                        class: "text-white hover:underline" do
                        "Twitter"
                      end
                    end

                    li do
                      a href: "https://discord.gg/6XdGnxVA2A",
                        class: "text-white hover:underline" do
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
                        class: "text-white hover:underline" do
                        "Mitchell Hanberg"
                      end
                    end
                  end
                end

                div do
                  h4 class: "text-lg font-medium mb-2", do: "Site"

                  ul do
                    li do
                      a href: "/feed.xml", class: "text-white hover:underline" do
                        "RSS"
                      end
                    end

                    li do
                      a href: "https://github.com/elixir-tools/elixir-tools.dev",
                        class: "text-white hover:underline" do
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

          if Mix.env() == :dev do
            c &Tableau.Components.live_reload/1
          end

          script async: true, defer: true, src: "https://buttons.github.io/buttons.js"
        end
      end
    end
  end
end
