# lib/slack_api_wrapper.rb
require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  ID = ENV["EDAMAM_ID"]
  KEYS = ENV["EDAMAM_KEYS"]

  def self.search_recipes(string)
    url = BASE_URL + "?q= #{string}" + "&app_id=#{ID}" + "&app_key=#{KEYS}"
    data = HTTParty.get(url)
    recipe_list = []
    if data["hits"]
      data["hits"].each do |item|
        wrapper = Recipe.new item["recipe"]["label"], link: item["recipe"]["url"], photo: item["recipe"]["image"]
        recipe_list << wrapper
      end
    end
    return recipe_list
  end
end
