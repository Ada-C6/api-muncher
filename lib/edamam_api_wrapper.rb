require 'httparty'
require 'uri'
require_relative 'recipe'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?"

  def self.list_recipes(search_term)

    # I'm making an executive decision to limit the search results being shown to 100
    url = BASE_URL + "q=#{search_term}" + "&to=100"
    data ||= HTTParty.get(url).parsed_response

    all_recipes = []

    data["hits"].each do |hit|
      # how to parse this uri to get the unique ID string after the underscore?
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
