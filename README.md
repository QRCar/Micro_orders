# Orders

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
  

## Route

http://localhost:4000/api/orders

         order_path  GET     /api/orders             OrdersWeb.OrderController :index
         order_path  GET     /api/orders/:id         OrdersWeb.OrderController :show
         order_path  POST    /api/orders             OrdersWeb.OrderController :create
         order_path  PATCH   /api/orders/:id         OrdersWeb.OrderController :update
                     PUT     /api/orders/:id         OrdersWeb.OrderController :update
         order_path  DELETE  /api/orders/:id         OrdersWeb.OrderController :delete

  
## Post

{
    "order" :  {
        "status": "test",
        "order_identifieur": "zed5a65d6a",
        "cost": "10.00",
        "establishment_id": "8a5bb308-f678-4fc6-8bc1-d8c7f61e0793",
        "user_id": "8a5bb308-f678-4fc6-8bc1-d8c7f61e0793" 
    }
}


