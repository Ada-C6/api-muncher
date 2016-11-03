require 'httparty'
require_relative 'recipe'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"

  def self.list_recipes(search_term, page_number)
    index = (page_number - 1)*10
    url = BASE_URL + "?q=#{search_term}" + "&from=#{index}"
    data ||= HTTParty.get(url).parsed_response

    all_recipes = []

    data["hits"].each do |hit|
      label = hit["recipe"]["label"]
      photo = hit["recipe"]["image"]
      url = hit["recipe"]["url"]
      ingredients = hit["recipe"]["ingredientLines"]
      diet = hit["recipe"]["dietLabels"]

      recipe = Recipe.new(label, photo, url, ingredients, diet)
      all_recipes << recipe
    end

    return all_recipes
  end
end
