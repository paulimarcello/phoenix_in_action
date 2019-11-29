# https://hexdocs.pm/phoenix/1.3.0/Phoenix.Router.html

# after the endpoint modules finishes, the request is passed to the router module
# the routers job is to decide which part of the application should respond next
# it does that by examining the path the user requests (http://example.com/posts/4)

# the router module decides which controller to send the request to
defmodule Blog.Router do
  use BlogWeb, :router

  # each pipeline sets up plugs that define functions for different kinds of requests

  # this pipeline groups plugs for a typical browser request
  pipeline :browser do
    plug :accepts, ["html"] # you accept "html" requests
    plug :fetch_session # getting the session
    plug :fetch_flash # getting the flash (which stores temporary messages for the user)
    plug :protect_from_forgery # set up forgery protection for your forms
    plug :put_secure_browser_headers
  end

  # this pipeline groups plugs for a typical API request
  pipeline :api do
    plug :accepts, ["json"] # only accepts json requests
  end


  # scopes groupe-related request paths and allows namespacing

  # listens for requests that are at the root level
  scope "/", BlogWeb do
    pipe_through :browser # first pipe request to through this pipeline

    get "/", PageController, :index # if request is a GET to /, send it to PageController and index function
    ressources "/posts", PostController do # this creates handlers for all seven verbs at the /posts location (index, new, create, show, edit, update and delete)
      ressources "/comments", CommentController, only: [:create] # http://example.com/posts/1/comments -> create/2 function
    end
  end

  scope "/api", BlogWeb.API do
    pipe_through :api

    resources "/posts", Postcontroller, only: [:index, :show] # pass to BlogWeb.API.PostController
  end
end
