
class Recipe_Results
  attr_reader :recipe_name, :recipe_uri, :image #, :purpose, :is_saved, :members

  def initialize(recipe_name, recipe_uri, image )

    if recipe_name == nil || recipe_uri == nil || recipe_name == "" || recipe_uri == ""
      raise ArgumentError
    end
    @recipe_name = recipe_name
    @recipe_uri = recipe_uri
    @image = image
  end


end
