require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?q="
  ID = ENV["app_id"]
  KEY = ENV["app_key"]

  def self.listrecipes(search_term)
    url = BASE_URL + "#{search_term}" + "&app_id=#{ID}&app_key=#{KEY}" #+ "&pretty=1&exclude_archived=1"
    data = HTTParty.get(url)
    recipe_list = []
    puts "#{url}"
    if data["hits"]
      data["hits"].each do |hit|
        info = { yield: hit["recipe"]["yield"], image: hit["recipe"]["image"], url: hit["recipe"]["url"], dietLabels: hit["recipe"]["dietLabels"], healthLabels: hit["recipe"]["healthLabels"], cautions: hit["recipe"]["cautions"], ingredientLines: hit["recipe"]["ingredientLines"] }

        wrapper = Recipe.new(hit["recipe"]["label"], hit["recipe"]["uri"], info)
        recipe_list << wrapper
      end
    end
    return recipe_list
  end


end
