# defmodule ElixirTools.Og.Layout do
#   use Tableau.Layout
#   use ElixirTools.Component
#
#   def template(assigns) do
#     temple do
#       render(@inner_content)
#     end
#   end
# end

defmodule ElixirTools.Og do
  # use Tableau.Page,
  #   layout: ElixirTools.Og.Layout,
  #   permalink: "/og/preview",
  #   title: "Some kind of page title",
  #   subtitle: "docs / next-ls"

  use ElixirTools.Component

  def template(assigns) do
    temple do
      "<!DOCTYPE html>"

      html lang: "en", class: "text-[18px]" do
        head do
          meta charset: "utf-8"
          meta http_equiv: "X-UA-Compatible", content: "IE=edge"
          meta name: "viewport", content: "width=device-width, initial-scale=1.0"

          style do
            File.read!("_site/css/site.css")
          end

          link rel: "stylesheet", href: "/css/site.css"
        end

        body class: "font-fancy bg-zinc-900 text-white border-[15px] border-gold-400 h-screen p-4" do
          div class: "flex flex-col justify-between h-full" do
            div class: "flex justify-between items-center" do
              img src: "https://elixir-tools.dev/elixir-tools-no-background.png",
                  class: "h-10 w-10 m-0"

              div class: "text-xl font-semibold" do
                "www.elixir-tools.dev"
              end
            end

            span class: "text-7xl text-center font-semibold" do
              @page.title
            end

            div do
              if @page[:subtitle] do
                div class: "text-xl font-semibold" do
                  @page.subtitle
                end
              end
            end
          end
        end
      end
    end
  end
end
