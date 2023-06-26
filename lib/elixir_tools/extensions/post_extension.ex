defmodule ElixirTools.PostExtension.Post do
  def build(filename, attrs, body) do
    attrs
    |> Map.put(:body, body)
    |> Map.put(:file, filename)
    |> Map.put(
      :permalink,
      attrs.permalink
      |> String.replace(":title", attrs.title)
      |> String.replace(" ", "-")
      |> String.replace(~r/[^[:alnum:]\/\-]/, "")
      |> String.downcase()
    )
  end
end

defmodule ElixirTools.PostExtension do
  use Tableau.Extension, type: :pre_build

  use NimblePublisher,
    build: __MODULE__.Post,
    from: "_posts/*.md",
    as: :posts,
    highlighters: [:makeup_elixir]

  def posts() do
    @posts
  end

  def run(_site) do
    for post <- posts() do
      {:module, _module, _binary, _term} =
        Module.create(
          post.id,
          quote do
            @external_resource unquote(post.file)
            use Tableau.Page,
              layout: unquote(post.layout),
              permalink: unquote(post.permalink)

            def template(_) do
              unquote(post.body)
            end
          end,
          Macro.Env.location(__ENV__)
        )
    end

    :ok
  end
end
