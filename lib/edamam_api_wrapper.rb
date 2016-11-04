# lib/slack_api_wrapper.rb
require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  ID = ENV["EDAMAM_ID"]
  KEYS = ENV["EDAMAM_KEYS"]
  @page = 2
  @start = 10 * (@page - 1)
  @finish = 10 * @page

  def self.search_recipes(string)

    url = BASE_URL + "?q= #{string}" + "&app_id=#{ID}" + "&app_key=#{KEYS}" #+ "&from=" + "#{@start}" "&to=" "#{@finish}"
    data = HTTParty.get(url)
    recipe_list = []
    if data["hits"]
      data["hits"].each do |item|
        wrapper = Recipe.new item["recipe"]["label"], link: item["recipe"]["url"], photo: item["recipe"]["image"], uri: item["recipe"]["uri"], health: item["recipe"]["healthLabels"], ingredients: item["recipe"]["ingredientLines"]
        recipe_list << wrapper
      end
    end
    return recipe_list
  end

  def self.one_recipe(string)

    url = BASE_URL + "?q= #{string}" + "&app_id=#{ID}" + "&app_key=#{KEYS}" #+ "&from=" + "#{@start}" "&to=" "#{@finish}"
    data = HTTParty.get(url)
    recipe_list = []
    if data["hits"]
      data["hits"].each do |item|
        wrapper = Recipe.new item["recipe"]["label"], link: item["recipe"]["url"], photo: item["recipe"]["image"], uri: item["recipe"]["uri"], health: item["recipe"]["healthLabels"], ingredients: item["recipe"]["ingredientLines"]
        recipe_list << wrapper
      end
    end
    return recipe_list
  end
end
