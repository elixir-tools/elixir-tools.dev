defmodule ElixirTools.PostLayout do
  use ElixirTools.Component
  use Tableau.Layout, layout: ElixirTools.RootLayout

  def template(assigns) do
    temple do
      main class: "container mx-auto px-2" do
        article class: "mx-auto max-w-4xl mb-8 pt-8" do
          div class: "flex items-center justify-between" do
            h1 class: "font-bold text-2xl" do
              @page.title
            end

            div do
              Calendar.strftime(@page.date, "%B %d, %Y")
            end
          end

          hr class: "mt-4 mb-8"

          article class: "prose dark:prose-invert" do
            render(@inner_content)
          end
        end
      end
    end
  end
end
