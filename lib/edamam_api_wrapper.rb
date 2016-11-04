# lib/slack_api_wrapper.rb
require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  ID = ENV["EDAMAM_ID"]
  KEYS = ENV["EDAMAM_KEYS"]

  def self.search_recipes(string, page)
    start = 10 * (page - 1)
    finish = 10 * page

    url = BASE_URL + "?q=#{string}" + "&app_id=#{ID}" + "&app_key=#{KEYS}" + "&from=" + "#{start}" "&to=" "#{finish}"
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

  def self.count(string)
    url = BASE_URL + "?q= #{string}" + "&app_id=#{ID}" + "&app_key=#{KEYS}"
    data = HTTParty.get(url)
    # Ensures that there is some number of hits
    if data["hits"]
      total_hits = data["count"]
    end
    return total_hits
  end

  #TO DRY UP and combine with self.search_recipes
  def self.one_recipe(string)

    url = BASE_URL + "?q= #{string}" + "&app_id=#{ID}" + "&app_key=#{KEYS}"
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
