defmodule FoodOrderWeb.Main.ItemsTest do
  use FoodOrderWeb.ConnCase
  import Phoenix.LiveViewTest

  describe "mount/3" do
    test "load items", %{conn: conn} do
      {:ok, view, html} = live(conn, Routes.main_path(conn, :index))
      assert html =~ "Make your order"
      assert has_element?(view, "#items-component")
      assert has_element?(view, "[data-role=items-info]")
      assert has_element?(view, "[data-id=all-foods]", "All foods")
    end
  end
end
