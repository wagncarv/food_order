defmodule FoodOrderWeb.Admin.Products.FormTest do
  use FoodOrderWeb.ConnCase
  import Phoenix.LiveViewTest
  alias FoodOrder.Products
  alias FoodOrderWeb.Router.Helpers, as: Routes

  describe "mount/3" do
    test "load modal to insert product", %{conn: conn} do
      {:ok, view, _html} = live(conn, Routes.admin_product_path(conn, :index))
      assert has_element?(view, "[data-role=modal]")
      assert has_element?(view, "[data-role=product-form]")

      assert view
             |> form("#new_product", product: %{name: nil})
             |> render_change() =~ "can&#39;t be blank"
    end

    test "when form is submitted, returns a message that the product has been created", %{
      conn: conn
    } do
      {:ok, view, _html} = live(conn, Routes.admin_product_path(conn, :index))

      payload = %{name: "T-shirt", description: "T-shirt", price: 68, size: "Large"}

      {:ok, _, html} =
        view
        |> form("#new_product",
          product: payload
        )
        |> render_submit()
        |> follow_redirect(conn, Routes.admin_product_path(conn, :index))

      assert html =~ "Product has been created!"
    end

    #

    test "when form is submitted, returns a changeset with error", %{
      conn: conn
    } do
      {:ok, view, _html} = live(conn, Routes.admin_product_path(conn, :index))

      payload = %{name: "pumpkin", description: "T-shirt", price: 68, size: "small"}
      assert {:ok, _product} = Products.create_product(payload)

      assert view
             |> form("#new_product", product: payload)
             |> render_submit() =~ "has already been taken"
    end
  end
end
