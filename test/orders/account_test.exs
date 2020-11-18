defmodule Orders.AccountTest do
  use Orders.DataCase

  alias Orders.Account

  describe "users" do
    alias Orders.Account.User

    @valid_attrs %{email: "some email", help: "some help", mix: "some mix", password: "some password", "phx.gen.context": "some phx.gen.context"}
    @update_attrs %{email: "some updated email", help: "some updated help", mix: "some updated mix", password: "some updated password", "phx.gen.context": "some updated phx.gen.context"}
    @invalid_attrs %{email: nil, help: nil, mix: nil, password: nil, "phx.gen.context": nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Account.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Account.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Account.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.help == "some help"
      assert user.mix == "some mix"
      assert user.password == "some password"
      assert user.phx.gen.context == "some phx.gen.context"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Account.update_user(user, @update_attrs)
      assert user.email == "some updated email"
      assert user.help == "some updated help"
      assert user.mix == "some updated mix"
      assert user.password == "some updated password"
      assert user.phx.gen.context == "some updated phx.gen.context"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_user(user, @invalid_attrs)
      assert user == Account.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Account.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Account.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Account.change_user(user)
    end
  end
end
