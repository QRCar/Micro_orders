defmodule OrdersWeb.OrderController do
  use OrdersWeb, :controller

  alias Orders.Purchase
  alias Orders.Purchase.Order

  action_fallback OrdersWeb.FallbackController

  def index(conn, _params) do
    order = Purchase.list_order()
    render(conn, "index.json", order: order)
  end

  def create(conn, %{"order" => order_params}) do
    with {:ok, %Order{} = order} <- Purchase.create_order(order_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.order_path(conn, :show, order))
      |> render("show.json", order: order)
    end
  end

  def show(conn, %{"id" => id}) do
    order = Purchase.get_order!(id)
    render(conn, "show.json", order: order)
  end

  def update(conn, %{"id" => id, "order" => order_params}) do
    order = Purchase.get_order!(id)

    with {:ok, %Order{} = order} <- Purchase.update_order(order, order_params) do
      render(conn, "show.json", order: order)
    end
  end

  def delete(conn, %{"id" => id}) do
    order = Purchase.get_order!(id)

    with {:ok, %Order{}} <- Purchase.delete_order(order) do
      send_resp(conn, :no_content, "")
    end
  end

  def getOrderByUser(conn, %{"user_id" => id}) do
    order = Purchase.get_order_by_user_id!(id)
    render(conn, "index.json", order: order)
  end

  def getOrderByEstablishment(conn, %{"establishment_id" => id}) do
    order = Purchase.get_order_by_establishment_id!(id)
    render(conn, "index.json", order: order)
  end

  def getOrderByMonth(conn, %{"date" => date}) do
    order = Purchase.get_order_by_month!(date)
    render(conn, "index.json", order: order)
  end

end
