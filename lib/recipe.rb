class Recipe
  attr_reader :recipe, :uri, :label, :url, :ingredients, :image, :yield, :health_labels, :diet_labels, :from

    def initialize(recipe, options = {})
      @recipe = recipe

      @uri = options[:uri]
      @label = options[:label]
      @url = options[:url]
      @ingredients = options[:ingredients]
      @image = options[:image]
      @yield = options[:yield]
      @health_labels = options[:health_labels]
      @diet_labels = options[:diet_labels]
    end


end
