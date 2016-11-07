class Recipe
  attr_reader :title, :image_url, :uri, :source_name, :recipe_url, :calories, :ingredient_objects, :diet_labels, :health_labels

  def initialize(title, image_url, uri, source_name, recipe_url, calories, ingredient_objects, diet_labels, health_labels)
    @title = title
    @image_url = image_url
    @uri = uri
    @source_name = source_name
    @recipe_url = recipe_url
    @calories = calories
    @ingredient_objects = ingredient_objects # array of JSON ingredient objects
    @diet_labels = diet_labels # array of strings
    @health_labels = health_labels # array of strings
  end #initialize

  def uri_id
    self.uri.split("_").last
  end

  def health_and_diet_labels
    return self.diet_labels + self.health_labels
  end

  # this method parses the API call data & returns just the recipe hit results, as an array of Recipe objects
  def self.search_results(data)
    search_response = data.parsed_response
    recipe_results = []

    if search_response["hits"]
      search_response["hits"].each do |hit|
        recipe = hit["recipe"]
        recipe_object = Recipe.new(
          recipe["label"],
          recipe["image"],
          recipe["uri"],
          recipe["source"],
          recipe["url"],
          recipe["calories"],
          recipe["ingredients"], # array of JSON ingredient objects
          recipe["dietLabels"], # array of strings
          recipe["healthLabels"] ) # array of strings

        recipe_results << recipe_object
      end
    end # if block
    return recipe_results
  end # self.search_results

end # class
