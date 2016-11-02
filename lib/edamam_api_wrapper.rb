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
        wrapper = Recipe.new(name: hit["recipe"]["label"], image: hit["recipe"]["image"], source_url: hit["recipe"]["url"], diet_labels: hit["recipe"]["dietLabels"], health_labels: hit["recipe"]["healthLabels"], cautions: hit["recipe"]["cautions"], ingredients: hit["recipe"]["ingredients"])
        recipe_list << wrapper
      end
    end
    return recipe_list
  end


end
