class Recipe
  attr_reader :name, :uri, :image, :ingredients, :dietary_information

  def initialize(label, uri, options ={})
    @name = label
    @uri = uri
    @image = options[:image]
    @ingredients = options[:ingredients]
    @diet_info = options[:dietary_information]
  end

  def self.recipe_look_up(recipe)
    @recipes ||= EdamamApiWrapper.find_recipes(params[:name])
  end

end
