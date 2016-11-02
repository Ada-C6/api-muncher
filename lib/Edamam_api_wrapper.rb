require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/"
  ID = ENV["EDAMAM_RECIPE_SEARCH_ID"]
  KEY = ENV["EDAMAM_RECIPE_SEARCH_AUTH_KEY"]

  def self.recipe_search(search_term)
    url = BASE_URL + "search?q=" + search_term  + "&app_id=" + ID + "&app_key=" + KEY
    data = HTTParty.get(url)
    recipe_list = []

    if !data["hits"].nil?
      data["hits"].each do |hit|
        name = hit["recipe"]["label"]
        api_hash = {recipe_image: hit["recipe"]["image"], source_url: hit["recipe"]["url"], ingredients: hit["recipe"]["ingredientLines"], calories: hit["recipe"]["calories"].to_i,
        dietary_info:
        hit["recipe"]["digest"].each do |nutrient|
          [
            nutrient["label"], nutrient["total"].to_f, nutrient["unit"]
          ]
        end
        yield: hit["recipe"]["yield"].to_i, source: hit["recipe"]["source"], source_icon: hit["recipe"]["souceIcon"]}
        recipe = Recipe.new(name, api_hash)
        recipe_list.push(recipe)
      end
      return recipe_list
    else
      return []
    end
  end
end
