defmodule Orders.Purchase.Order do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "orders" do
    field :order_identifieur, :string
    field :cost, :string
    field :status, :string

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:order_identifieur, :price, :status])
    |> validate_required([:order_identifieur, :price, :status])
  end
end
