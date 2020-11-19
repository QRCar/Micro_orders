defmodule Orders.Purchase.Order do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "order" do
    field :cost, :string
    field :establishment_id, Ecto.UUID
    field :order_identifieur, :string
    field :status, :string
    field :user_id, Ecto.UUID

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:cost, :status, :establishment_id, :user_id, :order_identifieur])
    |> validate_required([:cost, :status, :establishment_id, :user_id, :order_identifieur])
  end
end
