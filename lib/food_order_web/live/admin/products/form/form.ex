defmodule FoodOrderWeb.Admin.Products.Form do
  use FoodOrderWeb, :live_component
  alias FoodOrder.Products

  def update(assigns, socket) do
    IO.inspect(assigns)
    changeset = Products.change_product()
    {:ok,
      socket
      |> assign(assigns)
      |> assign(changeset: changeset)
    }
  end
end