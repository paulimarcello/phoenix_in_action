# the purpose of a controller is to gather and set up all the data that the
# next step will require
# this may include getting data from a database, an external API endpoint
# or some sort of static file
# the controller makes sure everything is available for rendering the response

# a controller function is also called _action_
defmodule BlogWeb.PostController do
  use BlogWeb, :controller

  alias Blog.App # aliases Blog.App to just App

  # every function in the controller expects the same default structure
  # -> the connection
  # -> a map of request parameters from the user

  def index(conn, _params) do

  end

  def new (conn, _params) do

  end

  def create(conn, %{post: post_params}) do

  end

  def show(conn, %{id: id}) do
    post = App.get_post_with_comments!(id)
    # setting up the basic structure of a new comment to seed the comment form with
    # also setting up a changeset (ecto)
    new_comment = App.change_comment(%{App.Comment{}})
    #            .- template to render
    #            -            .- keywork list or map
    render(conn, "show.html", post: post, new_comment: new_comment)
  end

  def edit(conn, %{id: id}) do

  end

  def update(conn, %{id: id, post: post_params}) do

  end

  def delete(conn, %{id: id}) do

  end
end
