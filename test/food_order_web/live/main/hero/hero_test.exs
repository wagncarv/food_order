defmodule FoodOrderWeb.MainLiveTest do
  use FoodOrderWeb.ConnCase
  import Phoenix.LiveViewTest

  describe "mount/3" do
    test "load hero", %{conn: conn} do
      {:ok, view, html} = live(conn, Routes.main_path(conn, :index))
      assert html =~ "Make your order"
      assert render(view) =~ "Make your order"
    end
  end
end
