defmodule ElixirTools.PostLayout do
  use ElixirTools.Component
  use Tableau.Layout, layout: ElixirTools.RootLayout

  def template(assigns) do
    temple do
      article class: "mx-auto max-w-4xl prose dark:prose-invert mb-8" do
        render(@inner_content)
      end
    end
  end
end
