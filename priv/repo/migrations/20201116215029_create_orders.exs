defmodule Orders.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :order_identifieur, :string
      add :price, :float
      add :status, :string

      timestamps()
    end

  end
end
