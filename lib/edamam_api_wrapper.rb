require 'httparty'
class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/"
  APP_ID = ENV["APP_ID"]
  APP_KEY =ENV["APP_KEY"]

  def self.listrecipes(search, from, to)
    #? means there is going to be parameters & before paramater
    url = BASE_URL + "search?" + "&q=#{search}" + "&from=#{from}" + "&to=#{to}" + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEY}"
    data = HTTParty.get(url)

    my_recipes = []
    if data["hits"]
      count = data["count"]
      data["hits"].map do |hit|
        recipe_hash = {
          label: hit["recipe"]["label"],
          image: hit["recipe"]["image"],
          uri: hit["recipe"]["uri"],
          ingredientLines: hit["recipe"]["ingredientLines"],
          totalNutrients: hit["recipe"]["totalNutrients"],
          url: hit["recipe"]["url"],
          calories: hit["recipe"]["calories"],
          healthLabels: hit["recipe"][:healthLabels],
          source: hit["recipe"]["source"]
        }
        wrapper = Recipe.new(recipe_hash)
        my_recipes << wrapper
      end
    end
    return my_recipes, count
  end

  # def self.count
  def self.get_recipe(id)
    recipe_uri = "http://www.edamam.com/ontologies/edamam.owl#recipe_#{id}"
    url = BASE_URL + "search?" + "r=#{URI.encode(recipe_uri)}"
    recipe = HTTParty.get(url)
    return recipe
  end
end
