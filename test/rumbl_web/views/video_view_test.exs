defmodule RumblWeb.VideoViewTest do
  use RumblWeb.ConnCase, async: true
  import Phoenix.View
  alias Rumbl.Multimedia.{Video, Category}

  @categories [%Category{id: 1, name: "Action"}, %Category{id: 3, name: "Comedy"}]

  test "renders index.html", %{conn: conn} do
    videos = [
      %Video{id: "1", title: "dogs", category: List.first(@categories)},
      %Video{id: "2", title: "cats"}
    ]

    content = render_to_string(
      RumblWeb.VideoView,
      "index.html",
      conn: conn,
      videos: videos)

    assert String.contains?(content, "Listing Videos")

    for video <- videos do
      assert String.contains?(content, video.title)
    end
  end

  test "renders new.html", %{conn: conn} do
    changeset = Rumbl.Multimedia.change_video(%Video{})

    content =
      render_to_string(RumblWeb.VideoView, "new.html",
        conn: conn,
        changeset: changeset,
        categories: @categories
      )

    assert String.contains?(content, "New Video")

    for category <- @categories do
      assert String.contains?(content, category.name)
    end
  end
end
