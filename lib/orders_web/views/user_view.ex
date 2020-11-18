defmodule OrdersWeb.UserView do
  use OrdersWeb, :view
  alias OrdersWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      email: user.email,
      password: user.password,
      mix: user.mix,
      help: user.help,
    }
  end
end
