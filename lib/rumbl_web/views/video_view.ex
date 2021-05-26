defmodule RumblWeb.VideoView do
  use RumblWeb, :view
  alias Rumbl.Multimedia.{Video, Category}

  def category_select_options(categories) do
    for category <- categories, do: {category.name, category.id}
  end

  def show_category_name(%Video{category: %Category{name: name}}) do
    name
  end

  def show_category_name(%Video{category_id: nil}) do
    nil
  end
end
