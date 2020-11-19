defmodule Orders.Repo.Migrations.CreateOrder do
  use Ecto.Migration

  def change do
    create table(:order, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :cost, :string
      add :status, :string
      add :establishment_id, :uuid
      add :user_id, :uuid
      add :order_identifieur, :string

      timestamps()
    end

  end
end
