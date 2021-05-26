defmodule RumblWeb.WatchViewTest do
  use RumblWeb.ConnCase, async: true
  import Phoenix.View
  alias RumblWeb.WatchView

  test "renders show.html", %{conn: conn} do
    video = %Rumbl.Multimedia.Video{id: 1, title: "dogs", url: "//youtube.com/watch?v=qwe123"}

    content = render_to_string(
      WatchView,
      "show.html",
      conn: conn,
      video: video)

    assert String.contains?(content, video.title)
    assert WatchView.player_id(video) == "qwe123"
    assert String.contains?(content, "Annotations")
  end
end
