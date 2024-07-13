defmodule PosAppWeb.Router do
  use PosAppWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {PosAppWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end
	
  pipeline :auth do
    plug Guardian.Plug.VerifyHeader
    plug Guardian.Plug.LoadResource
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PosAppWeb do
    pipe_through :browser

    get "/", PageController, :home
  end

# lib/pos_app_web/router.ex
  scope "/api", PosAppWeb do
    
    pipe_through [:api, :auth]
    post "/login", SessionController, :create
    get "/dashboard/overview", DashboardController, :overview
    
    resources "/products", ProductController, only: [:index, :show, :create, :update, :delete]
    resources "/customers", CustomerController, only: [:create, :update, :delete]
    resources "/users", UserController, only: [:index, :show, :create, :update, :delete]
    resources "/roles", RoleController, only: [:index, :show, :create, :update, :delete]
    resources "/roles", RoleController, except: [:new, :edit]
    resources "/time-entries", TimeEntryController, except: [:new, :edit]
    resources "/permissions", PermissionController, only: [:index, :show, :create, :update, :delete]
    resources "/role-assignments", RoleAssignmentController, only: [:index, :show, :create, :update, :delete]
    resources "/sales", SaleController, only: [:index, :show, :create, :update, :delete]
    resources "/orders", OrderController, only: [:index, :show, :create, :update, :delete]
    resources "/returns", ReturnController, only: [:index, :show, :create, :update, :delete]
    resources "/customers", CustomerController, except: [:new, :edit]
    resources "/loyalty-programs", LoyaltyProgramController, except: [:new, :edit]
    resources "/customers", CustomerController, except: [:new, :edit]
  
    post "/sales", SaleController, :create
    post "/auth/register", AuthController, :register
    post "/auth/login", AuthController, :login
    post "/products/scan", ProductController, :scan_barcode
    post "/barcode", BarcodeController, :scan
    post "/barcode_data", BarcodeController, :scan_data
    
    get "/reports/sales", ReportController, :sales_report
    get "/reports/inventory", ReportController, :inventory_report
    get "/reports/financial", ReportController, :financial_report
    get "/notifications", NotificationController, :index
    get "/users/:id", UserController, :show
    get "/support/contact_info", SupportController, :contact_info

    put "/notifications/:id/mark_as_read", NotificationController, :mark_as_read
    put "/users/:id", UserController, :update
    put "/profile", UserController, :update_profile
    put "/returns/:id/process", ReturnController, :process_refund
    put "/products/:id/stock", StockController, :update_stock

  end



  # Other scopes may use custom stacks.
  # scope "/api", PosAppWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:pos_app, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: PosAppWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
