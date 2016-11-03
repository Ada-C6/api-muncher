require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/"
  SEARCH = "search?q="
  APP_ID = ENV["EDAMAM_APP_ID"]
  APP_KEY = ENV["EDAMAM_APP_KEY"]

  def self.find_recipes(food)
    url = BASE_URL + SEARCH + "#{food}" + "&app_id=" + APP_ID + "&app_key=" + APP_KEY
    recipe = HTTParty.get(url)
    foods = []
    if recipe["hits"]
      recipe["hits"].each do |hit|
        info = {
          image: hit["recipe"]["image"],
          ingredients: hit["recipe"]["ingredientLines"],
          dietary_information: hit["recipe"]["healthLabels"],
          url: hit["recipe"]["url"]
        }
        wrapper = Recipe.new(hit["recipe"]["label"],  hit["recipe"]["uri"], info)
        foods << wrapper
      end
    end
    return foods
  end
end
