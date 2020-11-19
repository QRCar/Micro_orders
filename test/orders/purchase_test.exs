defmodule Orders.PurchaseTest do
  use Orders.DataCase

  alias Orders.Purchase

  describe "order" do
    alias Orders.Purchase.Order

    @valid_attrs %{cost: "some cost", establishment_id: "7488a646-e31f-11e4-aace-600308960662", order_identifieur: "some order_identifieur", status: "some status", user_id: "7488a646-e31f-11e4-aace-600308960662"}
    @update_attrs %{cost: "some updated cost", establishment_id: "7488a646-e31f-11e4-aace-600308960668", order_identifieur: "some updated order_identifieur", status: "some updated status", user_id: "7488a646-e31f-11e4-aace-600308960668"}
    @invalid_attrs %{cost: nil, establishment_id: nil, order_identifieur: nil, status: nil, user_id: nil}

    def order_fixture(attrs \\ %{}) do
      {:ok, order} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Purchase.create_order()

      order
    end

    test "list_order/0 returns all order" do
      order = order_fixture()
      assert Purchase.list_order() == [order]
    end

    test "get_order!/1 returns the order with given id" do
      order = order_fixture()
      assert Purchase.get_order!(order.id) == order
    end

    test "create_order/1 with valid data creates a order" do
      assert {:ok, %Order{} = order} = Purchase.create_order(@valid_attrs)
      assert order.cost == "some cost"
      assert order.establishment_id == "7488a646-e31f-11e4-aace-600308960662"
      assert order.order_identifieur == "some order_identifieur"
      assert order.status == "some status"
      assert order.user_id == "7488a646-e31f-11e4-aace-600308960662"
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Purchase.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      assert {:ok, %Order{} = order} = Purchase.update_order(order, @update_attrs)
      assert order.cost == "some updated cost"
      assert order.establishment_id == "7488a646-e31f-11e4-aace-600308960668"
      assert order.order_identifieur == "some updated order_identifieur"
      assert order.status == "some updated status"
      assert order.user_id == "7488a646-e31f-11e4-aace-600308960668"
    end

    test "update_order/2 with invalid data returns error changeset" do
      order = order_fixture()
      assert {:error, %Ecto.Changeset{}} = Purchase.update_order(order, @invalid_attrs)
      assert order == Purchase.get_order!(order.id)
    end

    test "delete_order/1 deletes the order" do
      order = order_fixture()
      assert {:ok, %Order{}} = Purchase.delete_order(order)
      assert_raise Ecto.NoResultsError, fn -> Purchase.get_order!(order.id) end
    end

    test "change_order/1 returns a order changeset" do
      order = order_fixture()
      assert %Ecto.Changeset{} = Purchase.change_order(order)
    end
  end
end
