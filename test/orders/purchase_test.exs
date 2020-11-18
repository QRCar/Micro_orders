defmodule Orders.PurchaseTest do
  use Orders.DataCase

  alias Orders.Purchase

  describe "orders" do
    alias Orders.Purchase.Order

    @valid_attrs %{order_identifieur: "some order_identifieur", price: 120.5, status: "some status"}
    @update_attrs %{order_identifieur: "some updated order_identifieur", price: 456.7, status: "some updated status"}
    @invalid_attrs %{order_identifieur: nil, price: nil, status: nil}

    def order_fixture(attrs \\ %{}) do
      {:ok, order} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Purchase.create_order()

      order
    end

    test "list_orders/0 returns all orders" do
      order = order_fixture()
      assert Purchase.list_orders() == [order]
    end

    test "get_order!/1 returns the order with given id" do
      order = order_fixture()
      assert Purchase.get_order!(order.id) == order
    end

    test "create_order/1 with valid data creates a order" do
      assert {:ok, %Order{} = order} = Purchase.create_order(@valid_attrs)
      assert order.order_identifieur == "some order_identifieur"
      assert order.price == 120.5
      assert order.status == "some status"
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Purchase.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      assert {:ok, %Order{} = order} = Purchase.update_order(order, @update_attrs)
      assert order.order_identifieur == "some updated order_identifieur"
      assert order.price == 456.7
      assert order.status == "some updated status"
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
