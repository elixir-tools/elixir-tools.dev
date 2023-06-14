defmodule ElixirTools.RootLayout do
  use ElixirTools.Component
  use Tableau.Layout

  def template(assigns) do
    temple do
      "<!DOCTYPE html>"

      html lang: "en" do
        head do
          meta charset: "utf-8"
          meta http_equiv: "X-UA-Compatible", content: "IE=edge"
          meta name: "viewport", content: "width=device-width, initial-scale=1.0"

          link rel: "stylesheet", href: "/css/site.css"
        end

        body class: "font-sans" do
          main class: "container mx-auto px-2" do
            render(@inner_content)
          end
        end

        if Mix.env() == :dev do
          c &Tableau.Components.live_reload/1
        end
      end
    end
  end
end
