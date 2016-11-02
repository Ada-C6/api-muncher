require 'httparty'

class Edamam_Api_Wrapper

  CLIENT_ID = ENV["EDAMAM_CLIENT_ID"]
  CLIENT_SECRET = ENV["EDAMAM_CLIENT_SECRET"]
  BASE_URL = "https://api.edamam.com/"

  def self.search(search_term, start_index)

    url = "#{BASE_URL}search?q=#{search_term}&from=#{start_index}&app_id=#{CLIENT_ID}&app_key=#{CLIENT_SECRET}"
    response = HTTParty.get(url)

    if response.code != 200
      return false
    end

    my_recipes = []

    response["hits"].each do |response_item|
      my_recipes << Recipe.new(response_item['recipe'])
    end

    return [my_recipes, response['count']]

  end

  def self.getrecipe(recipe_uri)

    url = "#{BASE_URL}search?r=http://www.edamam.com/ontologies/edamam.owl%23recipe_#{recipe_uri}&app_id=#{CLIENT_ID}&app_key=#{CLIENT_SECRET}"
    response = HTTParty.get(url)

    recipe = Recipe.new(response.first)

    return recipe
  end

end
