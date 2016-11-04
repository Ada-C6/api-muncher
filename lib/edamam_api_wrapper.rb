require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?"
  TOKEN = ENV["EDAMAM_CLIENT_ID"]

  def self.search_results(search_term, from, to)
    url = BASE_URL + "token=#{TOKEN}" + "&q=#{search_term}" + "&from=#{from}" + "&to=#{to}"
    results = HTTParty.get(url)["hits"]
    recipe_array = []
    results.each do |recipe|
      recipe_name = recipe["recipe"]["label"]
      recipe_image = recipe["recipe"]["image"]
      recipe_uri = recipe["recipe"]["uri"].split("_").last
      recipe_array << {name: recipe_name, uri: recipe_uri, image: recipe_image}
    end
    return recipe_array
  end

  def self.specific_search(uri)
    url = BASE_URL + "token=#{TOKEN}" + "&q=#{uri}"
    result = HTTParty.get(url)["hits"][0]

    recipe_hash = {}
    recipe_hash[:name] = result["recipe"]["label"]
    recipe_hash[:link] = result["recipe"]["url"]
    recipe_hash[:ingredients] = result["recipe"]["ingredientLines"]
    recipe_hash[:diet] = result["recipe"]["dietLabels"]
    recipe_hash[:image] = result["recipe"]["image"]
    return recipe_hash
  end


end
