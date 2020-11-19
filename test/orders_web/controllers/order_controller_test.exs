defmodule OrdersWeb.OrderControllerTest do
  use OrdersWeb.ConnCase

  alias Orders.Purchase
  alias Orders.Purchase.Order

  @create_attrs %{
    cost: "some cost",
    establishment_id: "7488a646-e31f-11e4-aace-600308960662",
    order_identifieur: "some order_identifieur",
    status: "some status",
    user_id: "7488a646-e31f-11e4-aace-600308960662"
  }
  @update_attrs %{
    cost: "some updated cost",
    establishment_id: "7488a646-e31f-11e4-aace-600308960668",
    order_identifieur: "some updated order_identifieur",
    status: "some updated status",
    user_id: "7488a646-e31f-11e4-aace-600308960668"
  }
  @invalid_attrs %{cost: nil, establishment_id: nil, order_identifieur: nil, status: nil, user_id: nil}

  def fixture(:order) do
    {:ok, order} = Purchase.create_order(@create_attrs)
    order
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all order", %{conn: conn} do
      conn = get(conn, Routes.order_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create order" do
    test "renders order when data is valid", %{conn: conn} do
      conn = post(conn, Routes.order_path(conn, :create), order: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.order_path(conn, :show, id))

      assert %{
               "id" => id,
               "cost" => "some cost",
               "establishment_id" => "7488a646-e31f-11e4-aace-600308960662",
               "order_identifieur" => "some order_identifieur",
               "status" => "some status",
               "user_id" => "7488a646-e31f-11e4-aace-600308960662"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.order_path(conn, :create), order: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update order" do
    setup [:create_order]

    test "renders order when data is valid", %{conn: conn, order: %Order{id: id} = order} do
      conn = put(conn, Routes.order_path(conn, :update, order), order: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.order_path(conn, :show, id))

      assert %{
               "id" => id,
               "cost" => "some updated cost",
               "establishment_id" => "7488a646-e31f-11e4-aace-600308960668",
               "order_identifieur" => "some updated order_identifieur",
               "status" => "some updated status",
               "user_id" => "7488a646-e31f-11e4-aace-600308960668"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, order: order} do
      conn = put(conn, Routes.order_path(conn, :update, order), order: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete order" do
    setup [:create_order]

    test "deletes chosen order", %{conn: conn, order: order} do
      conn = delete(conn, Routes.order_path(conn, :delete, order))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.order_path(conn, :show, order))
      end
    end
  end

  defp create_order(_) do
    order = fixture(:order)
    %{order: order}
  end
end
