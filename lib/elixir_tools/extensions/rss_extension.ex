defmodule ElixirTools.RssExtension do
  use Tableau.Extension, type: :pre_build, priority: 200

  def run(_) do
    # html
    prelude =
      """
      <rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
      <channel>
        <atom:link href="https://www.elixir-tools.dev/feed.xml" rel="self" type="application/rss+xml" />
        <title>elixir-tools</title>
        <link>https://www.elixir-tools.dev</link>
        <description>The best Elixir dev tooling that has ever existed.</description>
        <language>en-us</language>
        <generator>Tableau v#{version()}</generator>
      """

    # html
    items =
      for post <- ElixirTools.PostExtension.posts(all: Mix.env() == :dev), into: "" do
        """
            <item>
               <title>#{post.title}</title>
               <link>https://#{Path.join("www.elixir-tools.dev", post.permalink)}</link>
               <pubDate>#{Calendar.strftime(post.date, "%a, %d %b %Y %X %Z")}</pubDate>
               <guid>http://#{Path.join("www.elixir-tools.dev", post.permalink)}</guid>
               <description><![CDATA[ #{post.body} ]]></description>
            </item>
        """
      end

    # html
    postlude =
      """
        </channel>
      </rss>
      """

    File.mkdir_p!("_site")
    File.write!("_site/feed.xml", prelude <> items <> postlude)
  end

  defp version() do
    case :application.get_key(:tableau, :vsn) do
      {:ok, version} -> to_string(version)
      _ -> "dev"
    end
  end
end
