defmodule FoodOrderWeb.Main.ItemTest do
  use FoodOrderWeb.ConnCase
  import Phoenix.LiveViewTest

  describe "mount/3" do
    test "load item", %{conn: conn} do
      {:ok, view, html} = live(conn, Routes.main_path(conn, :index))
      assert html =~ "Make your order"
      assert has_element?(view, "#item-0")
      assert has_element?(view, "[data-role=product-image]")
      assert has_element?(view, "[data-id=item-0]")
      assert has_element?(view, "[data-role=product-description]")
      assert has_element?(view, "[data-role=product-name]")
      assert has_element?(view, "[data-role=product-price]", "$10")
      assert has_element?(view, "[data-role=product-add]")
    end
  end
end
