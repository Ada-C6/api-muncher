require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?q="
  KEY = ENV["APP_KEY"]
  ID = ENV["APP_ID"]

  def initialize(search_word)
    @search_word = search_word
  end

  def self.listrecipes(search_word)
    url = "#{BASE_URL}" + "#{@search_word}" + "&app_id=#{ID}" + "&app_key=#{KEY}"
    data = HTTParty.get(url)

    recipes_list = []

    if data["hits"]
      data["hits"].each do |entry|
        thing = Recipe.new(entry["recipe"]["label"], { image: entry["recipe"]["image"], source: entry["recipe"]["source"], ingredients: entry["recipe"]["ingredientLines"], url: entry["recipe"]["url"] } )
        recipes_list << thing
      end
    end

    return recipes_list
  end

end
