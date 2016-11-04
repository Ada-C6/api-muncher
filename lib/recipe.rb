class Recipe
  attr_reader :title, :image_url, :uri, :recipe_url, :calories, :ingredient_objects, :nutrients_object

  def initialize(title, image_url, uri, recipe_url, calories, ingredient_objects, nutrients_object)
    @title = title
    @image_url = image_url
    @uri = uri
    @recipe_url = recipe_url
    @calories = calories
    @ingredient_objects = ingredient_objects
    @nutrients_object = nutrients_object
  end #initialize

  def self.search_results(data)
    # this method will parse API call data & return just the results (rather than the whole response) as an array of Recipe objects

    search_response = data.parsed_response
    recipe_results = []

    if search_response["hits"]
      search_response["hits"].each do |hit|
        recipe = hit["recipe"]
        recipe_object = Recipe.new(
          recipe["label"],
          recipe["image"],
          recipe["uri"],
          recipe["url"],
          recipe["calories"],
          recipe["ingredients"], # array of JSON ingredient objects
          recipe["totalNutrients"] )

        recipe_results << recipe_object
      end
    end # if
    return recipe_results
  end # self.search_results
end
