class Recipe


  attr_reader :name, :id, :health_labels, :ingredients, :uri, :yield, :nutrients

  def initialize(recipe_hash)
    @name = recipe_hash[:name]
    @id = recipe_hash[:id]
    @health_labels = recipe_hash[:health_labels]
    @ingredients = recipe_hash[:ingredients]
    @uri = recipe_hash[:uri]
    @yield = recipe_hash[:yield]
    @nutrients = recipe_hash[:nutrients]
  end

end