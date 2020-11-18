defmodule Orders.Account.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :email, :string
    field :help, :string
    field :mix, :string
    field :password, :string
    field :"phx.gen.context", :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password, :mix, :help, :"phx.gen.context"])
    |> validate_required([:email, :password, :mix, :help, :"phx.gen.context"])
  end
end
