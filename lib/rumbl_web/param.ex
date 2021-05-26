defimpl Phoenix.Param, for: Rumbl.Multimedia.Video do
  alias Rumbl.Multimedia.Video

  def to_param(%Video{id: id} = video) do
    "#{id}-#{slugify_title(video)}"
  end

  defp slugify_title(%Video{title: title}) do
    title
    |> String.downcase()
    |> String.replace(~r/[^\w-]+/u, "-")
  end
end
