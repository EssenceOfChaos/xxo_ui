defmodule XxoUiWeb.Router do
  use XxoUiWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", XxoUiWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/games/new/:char", GameController, :new

    resources "/games", GameController
  end

  # Other scopes may use custom stacks.
  # scope "/api", XxoUiWeb do
  #   pipe_through :api
  # end
end
