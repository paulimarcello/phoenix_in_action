defmodule Auction.Item do
  use Ecto.Schema

  schema "items" do
    #:id will be generated automatically
    field :title, :string
    field :description, :string
    field :ends_at, :utc_datetime
    timestamps() #adds inserted_at and updated_at
  end

  #possible types
  #:id -> integer
  #:integer
  #:float
  #:boolean
  #:string
  #:date
  #:time
  #:naive_datetime
  #:utc_datetime
end
