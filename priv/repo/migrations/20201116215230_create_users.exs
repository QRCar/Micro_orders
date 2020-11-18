defmodule Orders.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :email, :string
      add :password, :string
      add :mix, :string
      add :help, :string
      add :"phx.gen.context", :string

      timestamps()
    end

  end
end
