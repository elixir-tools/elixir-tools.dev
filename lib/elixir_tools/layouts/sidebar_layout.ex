defmodule ElixirTools.SidebarLayout do
  use ElixirTools.Component
  use Tableau.Layout, layout: ElixirTools.RootLayout

  @sections %{
    "Getting Started" => 1,
    "Features" => 2,
    "Sidebar" => 2
  }

  def template(assigns) do
    docs =
      assigns.site.pages
      |> Enum.filter(&(&1.layout == ElixirTools.DocLayout))
      |> Enum.group_by(& &1.section)
      |> Enum.map(fn {section, pages} ->
        {section,
         pages
         |> Enum.sort_by(& &1.order)}
      end)
      |> Enum.sort_by(fn {section, _} ->
        @sections[section]
      end)

    headers =
      assigns.page.body
      |> Floki.parse_fragment!()
      |> Floki.find("h2")
      |> Enum.map(fn h ->
        [href] =
          h
          |> Floki.find("a")
          |> Floki.attribute("href")

        text = Floki.text(h)
        {text, href}
      end)

    page =
      Map.put(assigns.page, :headers, headers)

    assigns =
      assigns
      |> Map.put(:docs, docs)
      |> Map.put(:page, page)

    temple do
      div class: "flex h-full" do
        div id: "sidebar",
            class:
              "hidden z-20 dark:bg-zinc-950 lg:block fixed px-4 w-full lg:w-64 border-r border-white pt-4 h-full overflow-y-auto max-h-[calc(100%-110px)]" do
          aside do
            for {section_header, pages} <- @docs do
              h3 class:
                   "font-fancy text-sm font-normal text-zinc-400 border-l-4 mb-2 border-transparent pl-1" do
                section_header
              end

              ul class: "list-none space-y-1" do
                for page <- pages do
                  li class: "m-0" do
                    a class: [
                        "border-l-4 pl-1 no-underline": true,
                        "font-normal border-gold-400": page.permalink == @page.permalink,
                        "font-thin border-transparent": page.permalink != @page.permalink
                      ],
                      href: "#{page.permalink}" do
                      page.title
                    end
                  end
                end
              end
            end
          end
        end

        div class: "hidden lg:block px-4 min-w-[16rem]"

        div class: "w-full pt-8 lg:px-2 flex-1 overflow-auto" do
          div class: "prose dark:prose-invert container mx-auto px-2" do
            render(@inner_content)
          end

          div class: "lg:px-4" do
            c &ElixirTools.RootLayout.footer/1, data: @data
          end
        end

        aside class: "hidden xl:block min-w-[12rem] px-4 pt-4 h-full" do
          div class: "fixed" do
            h3 class: "font-fancy text-sm font-normal text-zinc-400 mb-2" do
              "On this page"
            end

            ul class: "list-none space-y-1" do
              for {hdr, href} <- @page.headers do
                li class: "m-0" do
                  a class: "no-underline font-thin",
                    href: href do
                    hdr
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
