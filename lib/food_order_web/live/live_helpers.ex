defmodule FoodOrderWeb.LiveHelpers do
  use FoodOrderWeb, :live_component
  import Phoenix.LiveView.Helpers

  def render(assigns) do
    ~H"""
      <div class="phx-modal fade-in">
        <div class="phx-modal-content fade-in-scale">
            <form action="" method="post">
                <input type="text" placeholder="Name" name="name" id="name">
                <input type="text" placeholder="Description" name="description" id="description">
                <input type="text" placeholder="Price" name="price" id="price">
                <input type="text" placeholder="Size" name="size" id="size">
                <button type="submit">Criar produto</button>
            </form>
        </div>
      </div>
    """
  end
end
