require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?q="
  ID = ENV["app_id"]
  KEY = ENV["app_key"]
  LAST = 1000

  def self.listrecipes(search_term)
    # This is a gross :(
    Dotenv.load
    @edamam_id ||= ENV["app_id"]
    @edamam_key ||= ENV["app_key"]

    url = BASE_URL + "#{search_term}" + "&app_id=#{@edamam_id}&app_key=#{@edamam_key}" + "&to=" + "#{LAST}"
    data = HTTParty.get(url)
    recipe_list = []

    if data["hits"]
      data["hits"].each do |hit|
        info = { yield: hit["recipe"]["yield"], image: hit["recipe"]["image"], level: hit["recipe"]["level"], url: hit["recipe"]["url"], dietLabels: hit["recipe"]["dietLabels"], healthLabels: hit["recipe"]["healthLabels"], calories: hit["recipe"]["calories"], ingredientLines: hit["recipe"]["ingredientLines"] }

        wrapper = Recipe.new(hit["recipe"]["label"], hit["recipe"]["uri"], info)

        recipe_list << wrapper
      end
    end
    return recipe_list
  end

end
