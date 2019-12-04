### load file into iex   
iex -r filename   

### recompile from iex session   
c "filename"   

### show all created routes   
mix phx.routes   

### search for packages   
mix hex.search react   

### hex packages   
usally uses semantic versioning (major.minor.patch)   
defp deps do   
[   
    {:ecto_sql, "> 3.0.3"} # does not include 3.0.3.   
    {:ecto_sql, ">= 3.0.3"} # includes 3.0.3.   
    {:ecto_sql, "< 4.0"}   
    {:ecto_sql, ">= 3.0.3 and < 3.1.0"}   
    {:ecto_sql, "~> 3.0.3"} #doesn't increment the minor version   
    {:ecto_sql, "~> 3.0"} #doesn't increment the major version   
]   

### clean dependencies from harddrive
mix deps.clean

### install phoenix   
mix archive.install hex phx_new 1.4.11   
also need node.js   
move to [...]/apps
mix phx.new.web auction_web --no-ecto

### start phoenix server
mix phx.server   
iex -S mix phx.server # allows you to enter commands while also running the server

### add dependency from one app to another app within the same umbrella
defp deps do   
[   
    {:auction, in_umbrella: true}   
]   
end   

### view
use <%= %> for using elixir and then rendering the results   
use <% %> for using elixir _without_ rendering the results   

### ecto create database
> mix ecto.create

### ecto migration
migrations are code that allows building up and tearing down databases programmatically
used, when ecto.schema is defined (or changed)   

_to create a migration:_   
mix ecto.gen.migration <filename>   
e.g. mix ecto.gen.migration create_items   
must be run within the proper /apps/<...>   

_current status of migrations:_   
mix ecto.migrations   
> down === hasn't yet been run   

_run a migration:_   
mix ecto.migrate   

_migration path:_   
mix ecto migrate  > calls up/0 or determines changes from change/0:  migr1 -> migr2 -> migr3   
mix ecto.rollback > call down/0 or determines changes from change/0: migr3 -> migr2 -> migr1   
mix ecto.migrate will migrate up as far as possible   
mix ecto.rollback will only rollback 1 migration at a time   