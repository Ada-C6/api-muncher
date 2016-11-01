require 'httparty'
#require 'recipe'
require_relative './recipe'

class RecipeSearchApiWrapper
  BASE_URL = "https://api.edamam.com/"
  APP_ID = "f8c6af19"
  APP_KEY = "3e974f32b9b7c425a0a6e4bae6e5e131"

  def self.search(term)
    url = BASE_URL + "search?" + "q=#{term}" + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEY}"
    response = HTTParty.get(url)
    # puts response

    recipes = []
    hits = response['hits']
    hits.each do |hit|
      recipes << Recipe.new(hit['recipe'])
    end
    return recipes
  end
end
