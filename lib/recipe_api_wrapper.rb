require 'httparty'
require 'uri'
require_relative 'recipe'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?"

  def self.list_recipes(search_term)
    # index = (page_number - 1)*10
    # url = BASE_URL + "q=#{search_term}" + "&from=#{index}"
    url = BASE_URL + "q=#{search_term}"
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

  def self.list_a_recipe(id)
    # how to add a new uri to the current http uri?
    url = BASE_URL + "r=" + "http://www.edamam.com/ontologies/edamam.owl%23" + "#{id}"

    data ||= HTTParty.get(url).parsed_response

    label = data[0]["label"]
    photo = data[0]["image"]
    url = data[0]["url"]
    ingredients = data[0]["ingredientLines"]
    diet = data[0]["dietLabels"]

    recipe = Recipe.new(id, label, photo, url, ingredients, diet)
    return recipe
  end
end
