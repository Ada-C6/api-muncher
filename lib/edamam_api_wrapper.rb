require 'httparty'
require 'uri'
require_relative 'recipe'

require 'dotenv'
Dotenv.load

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?"
  ID = ENV["EDAMAM_APP_ID"]
  KEY = ENV["EDAMAM_APP_KEY"]
  MAX_RESULTS = 100
  # I'm making an decision to limit the search results being shown to 100

  def self.list_recipes(search_term)
    url = BASE_URL + "q=#{search_term}" + "&app_id=#{ID}&app_key=#{KEY}&to=#{MAX_RESULTS}"

    data ||= HTTParty.get(url).parsed_response

    all_recipes = []

    data["hits"].each do |hit|
      # how to parse this uri to get the unique ID string after the underscore? use uri.fragment from the URI library.
      #http://www.edamam.com/ontologies/edamam.owl#recipe_c468dc28f8b64bb711125cc150b15c25

      uri = URI.parse(hit["recipe"]["uri"])
      id = uri.fragment
      label = hit["recipe"]["label"]
      photo = hit["recipe"]["image"]
      url = hit["recipe"]["url"]
      ingredients = hit["recipe"]["ingredientLines"]
      diet = hit["recipe"]["dietLabels"]

      recipe = Recipe.new(id, label, photo, url, ingredients, diet)
      all_recipes << recipe
    end

    return all_recipes
  end

end
