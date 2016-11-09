require 'httparty'

class EdamamApiWrapper
  ID = ENV["EDAMAM_ID"]
  KEY = ENV["EDAMAM_KEY"]
  BASE_URL = 'https://api.edamam.com/search?'

  def self.search_recipe(search_term, page)
    start_at = 10 * (page - 1)
    url = BASE_URL + "q=#{search_term}" + "&app_id=#{ID}" + "&app_key=#{KEY}" + "&from=#{start_at}"
    data = HTTParty.get(url)

    recipes = []
    data["hits"].each do |hit|
      recipe_hash = {
      label: hit["recipe"]["label"],
      url: hit["recipe"]["url"],
      ingredients: hit["recipe"]["ingredients"],
      diet_labels: hit["recipe"]["dietLabels"],
      image: hit["recipe"]["image"],
      uri: hit["recipe"]["uri"].split("_").last
      }
      wrapper = Recipe.new(recipe_hash)
      recipes << wrapper
    end
    return recipes
  end

  def self.by_id(id)
    url = BASE_URL + "r=http://www.edamam.com/ontologies/edamam.owl%23recipe_" + id + "&app_id=#{ID}" + "&app_key=#{KEY}"

    recipe_info = HTTParty.get(url)
    # recipe_hash = {
    #   label: recipe_info[0]["label"],
    #   url: recipe_info[0]["url"],
    #   ingredients: recipe_info[0]["ingredients"],
    #   diet_labels: recipe_info[0]["dietLabels"],
    #   image: recipe_info[0]["image"],
    #   uri: recipe_info[0]["uri"]
    # }
    # wrapper = Recipe.new(recipe_hash)
    return recipe_info
  end
end
