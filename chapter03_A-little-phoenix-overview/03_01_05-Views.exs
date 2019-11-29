# the view is responsible for rendering templates and for setting up helper functions
# that can be used in the templates
# functions defined here are similar to decorators or presenters in other frameworks

# the controller calls functions defined in the view
defmodule BlogWeb.PostView do
  use BlogWeb, :view # brings in most of the functions needed by the template
                     # including render/3

  def date(date_to_display) do
    Date.to_string(date_to_display)
  end
end
