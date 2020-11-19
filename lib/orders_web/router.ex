defmodule OrdersWeb.Router do
  use OrdersWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", OrdersWeb do
    pipe_through :api
    resources "/orders", OrderController, except: [:new, :edit]
    get "/orders/by_user/:user_id", OrderController, :getOrderByUser
    get "/orders/by_month/:date", OrderController, :getOrderByMonth
    get "/orders/by_establishment/:establishment_id", OrderController, :getOrderByEstablishment
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: OrdersWeb.Telemetry
    end
  end
end
