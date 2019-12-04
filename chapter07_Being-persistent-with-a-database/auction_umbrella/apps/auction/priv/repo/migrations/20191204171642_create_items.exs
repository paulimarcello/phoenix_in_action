defmodule Auction.Repo.Migrations.CreateItems do
  use Ecto.Migration

  # can also be an up/0 and down/0 function

  # creating the table
  def change do
    #create/1 can create tables, indexes, and constraints
    # creates id by default
    create table("items") do
      add :title, :string
      add :description, :string
      add :ends_at, :utc_datetime
      timestamps()
    end
  end
end
