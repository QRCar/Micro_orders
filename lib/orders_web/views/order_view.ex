defmodule OrdersWeb.OrderView do
  use OrdersWeb, :view
  alias OrdersWeb.OrderView

  def render("index.json", %{order: order}) do
    %{data: render_many(order, OrderView, "order.json")}
  end

  def render("show.json", %{order: order}) do
    %{data: render_one(order, OrderView, "order.json")}
  end

  def render("order.json", %{order: order}) do
    %{id: order.id,
      cost: order.cost,
      status: order.status,
      establishment_id: order.establishment_id,
      user_id: order.user_id,
      date: order.inserted_at
    }
  end
end
