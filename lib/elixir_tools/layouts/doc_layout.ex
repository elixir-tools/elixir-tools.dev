defmodule ElixirTools.DocLayout do
  use ElixirTools.Component
  use Tableau.Layout, layout: ElixirTools.SidebarLayout

  def template(assigns) do
    temple do
      article class: "mx-auto max-w-4xl mb-8" do
        div class: "flex items-center justify-between" do
          h1 class: "font-bold text-2xl" do
            @page.title
          end
        end

        hr class: "mt-4 mb-8"

        article class: "prose dark:prose-invert mb-16" do
          render(@inner_content)
        end
      end
    end
  end
end
