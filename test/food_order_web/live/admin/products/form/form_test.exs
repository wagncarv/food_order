defmodule FoodOrderWeb.Admin.Products.FormTest do
  use FoodOrderWeb.ConnCase
  import Phoenix.LiveViewTest
  # import FoodOrder.Factory

  describe "mount/3" do
    test "load modal to insert product", %{conn: conn} do
      # product = insert(:product)
      {:ok, view, _html} = live(conn, Routes.admin_product_path(conn, :index))
      assert has_element?(view, "[data-role=modal]")
      assert has_element?(view, "[data-role=product-form]")

      assert view
             |> form("#new_product", product: %{name: nil})
             |> render_change() =~ "can&#39;t be blank"
    end
  end
end
