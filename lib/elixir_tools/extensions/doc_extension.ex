defmodule ElixirTools.DocExtension.Config do
  @moduledoc false

  def new(input), do: {:ok, input}
end

defmodule ElixirTools.DocExtension.Docs.Doc do
  @moduledoc false
  def build(filename, attrs, body) do
    attrs
    |> Map.put(:body, body)
    |> Map.put(:file, filename)
    |> Map.put(:layout, Module.concat([attrs.layout]))
    |> then(fn doc ->
      headers =
        body
        |> Floki.parse_fragment!()
        |> Floki.find("h2")
        |> Enum.map(&Floki.text/1)

      Map.put(doc, :headers, headers)
    end)
    |> build_permalink()
  end

  def parse(_file_path, content) do
    Tableau.YamlFrontMatter.parse!(content, atoms: true)
  end

  defp build_permalink(%{file: filename} = attrs) do
    filename
    |> Path.rootname()
    |> transform_permalink(attrs)
    |> then(&Map.put(attrs, :permalink, &1))
  end

  defp transform_permalink(path, attrs) do
    vars = Map.new(attrs, fn {k, v} -> {":#{k}", v} end)

    Path.join(
      "/",
      path
      |> String.replace(Map.keys(vars), &to_string(Map.fetch!(vars, &1)))
      |> String.replace(" ", "-")
      |> String.replace(~r/[^[:alnum:]\/\-]/, "")
      |> String.downcase()
    )
  end
end

defmodule ElixirTools.DocExtension.Docs.HTMLConverter do
  @moduledoc false
  def convert(_filepath, body, _attrs, _opts) do
    MDEx.to_html(body, features: [syntax_highlight_theme: "kanagawa"])
  end
end

defmodule ElixirTools.DocExtension do
  use Tableau.Extension, enabled: true, key: :docs, type: :pre_build

  def run(token) do
    :global.trans(
      {:create_docs_module, make_ref()},
      fn ->
        Module.create(
          ElixirTools.DocExtension.Docs,
          quote do
            use NimblePublisher,
              build: __MODULE__.Doc,
              from: "_docs/**/*.md",
              as: :docs,
              parser: ElixirTools.DocExtension.Docs.Doc,
              html_converter: ElixirTools.DocExtension.Docs.HTMLConverter

            def docs(_opts \\ []) do
              @docs
            end
          end,
          Macro.Env.location(__ENV__)
        )

        docs =
          for doc <- apply(ElixirTools.DocExtension.Docs, :docs, []) do
            {:module, _module, _binary, _term} =
              Module.create(
                Module.concat([doc.id]),
                quote do
                  use Tableau.Page, unquote(Macro.escape(Keyword.new(doc)))

                  @external_resource unquote(doc.file)
                  def template(_assigns) do
                    unquote(doc.body)
                  end
                end,
                Macro.Env.location(__ENV__)
              )

            doc
          end

        {:ok, Map.put(token, :docs, docs)}
      end,
      [Node.self()],
      :infinity
    )
  end
end
