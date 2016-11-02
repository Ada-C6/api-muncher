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

        dietary_info = []

        hit["recipe"]["digest"].map do |nutrient|
          if nutrient["sub"].nil?
            dietary_info.push(nutrient["label"] + " " + nutrient["total"].to_s + nutrient["unit"])
          else
            dietary_info.push(nutrient["label"] + " " + nutrient["total"].to_s + nutrient["unit"])
            nutrient["sub"].each do |sub_nutrient|
              dietary_info.push(sub_nutrient["label"] + " " + sub_nutrient["total"].to_s + sub_nutrient["unit"])
            end
          end
        end
        api_hash = {
          recipe_image: hit["recipe"]["image"],
          source_url: hit["recipe"]["url"],
          ingredients: hit["recipe"]["ingredientLines"],
          calories: hit["recipe"]["calories"].to_i,
          dietary_info: dietary_info,
          yield: hit["recipe"]["yield"].to_i,
          source: hit["recipe"]["source"],
          source_icon: hit["recipe"]["souceIcon"]}

        recipe = Recipe.new(name, api_hash)
        recipe_list.push(recipe)

      end
      return recipe_list
    else
      return []
    end
  end
end
