class Recipe
  attr_reader :name, :uri, :image, :ingredients, :diet_info, :url

  def initialize(label, uri, options ={})
    raise ArguementError if label == nil || label == ""
    @name = label
    @uri = uri
    @image = options[:image]
    @ingredients = options[:ingredients]
    @diet_info = options[:dietary_information]
    @url = options[:url]
  end

  def self.recipe_look_up(recipe)
    @recipes = EdamamApiWrapper.find_recipes(recipe)
    return @recipes.first
  end

end
