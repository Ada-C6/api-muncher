require 'httparty'

class EdamamApiWrapper

  BASE_URL = "https://api.edamam.com/"
  ID = ENV["EDAMAM_ID"]
  KEY = ENV["EDAMAM_KEY"]

  def self.listrecipes
    url = BASE_URL + "search?" + "all" + "app_id=#{ID}" + "app_key=#{KEY}"

    data = HTTParty.get(url)
    recipes = []
    if data["hits"]
      data["hits"].each do|hit|
        wrapper = Recipe.new hit["recipe"]["label"], uri: hit["recipe"]["uri"], label: hit["recipe"]["label"], ingredients: hit["recipe"]["ingredients"], diet_labels: hit["recipe"]["dietLabels"]
        recipes << wrapper
      end
    end
    return recipes
  end

  def self.findrecipes(keyword)
    puts "Finding recipes with this keyword: #{keyword}"

    url = BASE_URL + "search?" + keyword + "app_id=#{ID}" + "app_key=#{KEY}"
    data = HTTParty.get(url)
    recipes = []

    if data["hits"]
      data["hits"].each do|hit|
        wrapper = Recipe.new hit["recipe"]["label"], uri: hit["recipe"]["uri"], label: hit["recipe"]["label"], ingredients: hit["recipe"]["ingredients"], diet_labels: hit["recipe"]["dietLabels"]
        recipes << wrapper

      end
    end
    return recipes
  end
end
