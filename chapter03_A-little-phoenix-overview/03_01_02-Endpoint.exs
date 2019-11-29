# when a reuqest comes in, cowboy is the server that handles it
# it does its stuff and then handles the request to phoenix
# the first piece of phoenix code that handles the request is the endpoint module
defmodule BlogWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :blog # sets up the endpoint

  socket "/socket", BlogWeb.UserSocket, websocket: true, longpoll: false

  # plug is a macro that sets up a plug which simply receives a connection and returns a connection
  # https://hexdocs.pm/plug/readme.html

  # plug automatically pipes data from one plug to the next, from top to buttom
  # each plug can add or modify data as needed

  # serve up static files in your application at "/", no compress and only from directories css, fonts, images and js
  plug Plug.Static,
    at: "/", from: :blog, gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  # default to yes in development
  # Live-code reloading listens for changes in your code and automatically reloads the current page
  # reloads the current page in your browser to display the updated results
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  # generates a unique ID for each request
  # https://hexdocs.pm/plug/Plug.RequestId.html
  plug Plug.RequestId

  # sets up a logger
  # logger automatically logs information for each request made
  # you can explicitly log your own information as well
  plug Plug.Logger

  # sets up different file handlers
  plug.Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library() #decode JSON data with the default library


  #mostly for Phoenix’s benefit under the hood

  # overrides some browser requests so that Phoenix can better handle them
  # https://hexdocs.pm/plug/Plug.MethodOverride.html
  plug Plug.MethodOverride
  # simply converts HEAD requests to GET requests
  # https://hexdocs.pm/plug/Plug.Head.html
  plug Plug.Head

  # sets up a session which will handle your session data, such as cookies, used for serving up dynamic
  # web pages that are customized for each user
  plug Plug.Session,
    store: :cookie,
    key: "_blog_key",
    signing_salt: "JN+IDg+a"

  # routes the request to the correct handler within the application
  plug BlogWeb.Router
end
