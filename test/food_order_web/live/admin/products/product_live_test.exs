defmodule FoodOrderWeb.Admin.ProductLiveTest do
  use FoodOrderWeb.ConnCase
  import Phoenix.LiveViewTest
  import FoodOrder.Factory

  describe "mount/3" do
    test "load page", %{conn: conn} do
      product = insert(:product)
      {:ok, view, _html} = live(conn, Routes.admin_product_path(conn, :index))
      assert has_element?(view, "[data-role=product-section]")
      assert has_element?(view, "[data-role=product-table]")
      assert has_element?(view, "[data-id=head-name]", "Name")
      assert has_element?(view, "[data-id=head-price]", "Price")
      assert has_element?(view, "[data-id=head-size]", "Size")
      assert has_element?(view, "[data-id=head-actions]", "Actions")
      assert has_element?(view, "[data-role=product-list]")

      # Test Product
      assert has_element?(view, "[data-role=product-item][data-id=#{product.id}]")
      assert has_element?(view, "[data-role=product-name][data-id=#{product.id}]", product.name)

      assert element(
               view,
               "[data-role=product-price][data-id=#{product.id}]"
             )
             |> render =~ "R$2.00"

      assert has_element?(
               view,
               "[data-role=product-actions][data-id=#{product.id}]",
               "Show | Edit | Delete"
             )
    end
  end
end
