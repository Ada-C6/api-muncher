require 'httparty'

class EdemamApiWrapper
  BASE_URL = "https://api.edamam.com/"
  TOKEN = ENV["TOKEN"]
  APP_ID = ENV["APP_ID"]

  # Need to request a list of recipes given a specified search term
  def self.list_recipes(search_term)
    url = BASE_URL + "search?" + "q=#{search_term}" + "&app_id=#{APP_ID}" + "&app_key=#{TOKEN}"

    data = HTTParty.get(url)
    recipes = []
    if data["hits"] # if the request was successful we should have recieved "hits" from the api
      # puts = "success"
      data["hits"].each do |hit|
        wrapper = Recipe.new(hit["recipe"]["uri"], label: hit["recipe"]["label"], image: hit["recipe"]["image"])
        recipes << wrapper
      end
      return recipes
    else
      return nil
    end

  end

  def self.get_a_recipe(uri)
    url = BASE_URL + "search?" + "r=#{uri}" + "&app_id=#{APP_ID}" + "&app_key=#{TOKEN}"

    data = HTTParty.get(url)
    if data["uri"]
      recipe = Recipe.new(["uri"], label: ["label"], image: ["image"], source: ["source"], url: ["url"], yield: ["yield"], ingredientLines: ["ingredientLines"], healthLabels: ["healthLabels"])
    else
      return nil
    end
  end

end

  # curl "https://api.edamam.com/search?q=chicken&app_id=${YOUR_APP_ID}&app_key=${YOUR_APP_KEY}"
