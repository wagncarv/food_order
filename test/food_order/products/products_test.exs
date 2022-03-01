defmodule FoodOrder.ProductsTest do
  use FoodOrder.DataCase, async: true
  alias FoodOrder.Products
  alias FoodOrder.Products.Product

  describe "list_products/0" do
    test "Test get product list, returns a list of products" do
      assert Products.list_products() == []
    end
  end

  describe "create_product/1" do
    test "When all params are correct, creates a new product" do
      payload = %{name: "Pizza Napolitana", price: 87, size: "35", description: "New product"}
      assert {:ok, %Product{} = product} = Products.create_product(payload)
      assert product.description == payload.description
      assert product.name == payload.name
      assert product.price == payload.price
      assert product.size == payload.size
    end
  end
end
