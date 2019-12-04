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