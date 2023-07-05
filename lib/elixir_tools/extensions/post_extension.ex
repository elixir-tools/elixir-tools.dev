defmodule ElixirTools.PostExtension.Post do
  def build(filename, attrs, body) do
    attrs
    |> Map.put(:body, body)
    |> Map.put(:file, filename)
    |> Map.put(:date, DateTime.from_naive!(attrs.date, "America/Indiana/Indianapolis"))
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
  use Tableau.Extension, type: :pre_build, priority: 100

  use NimblePublisher,
    build: __MODULE__.Post,
    from: "_posts/*.md",
    as: :posts,
    highlighters: [:makeup_elixir]

  def posts(opts \\ []) do
    all? = Keyword.get(opts, :all, false)

    @posts
    |> Enum.sort_by(& &1.date, {:desc, DateTime})
    |> then(fn posts ->
      if all? do
        posts
      else
        Enum.reject(posts, &(DateTime.compare(&1.date, DateTime.utc_now()) == :gt))
      end
    end)
  end

  def run(_site) do
    for post <- posts(all: Mix.env() == :dev) do
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
