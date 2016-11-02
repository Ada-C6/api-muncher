require 'httparty'

class EdamamApiWrapper

  BASE_URL = "https://api.edamam.com/search"
  ID = ENV["EDAMAM_ID"]
  KEY = ENV["EDAMAM_KEY"]


  def self.findrecipes(keyword, startindex, endindex) 
    puts "Finding recipes with this keyword: #{keyword}"

    url = BASE_URL + "?q=" + keyword + "&app_id=#{ID}" + "&app_key=#{KEY}" + "&from=#{startindex}" + "&to=#{endindex}"
    data = HTTParty.get(url)
    recipes = []

    if data["hits"]
      data["hits"].each do|hit|
        wrapper = Recipe.new hit["recipe"]["label"],
          uri: hit["recipe"]["uri"],
          label: hit["recipe"]["label"],
          ingredients: hit["recipe"]["ingredients"],
          diet_labels: hit["recipe"]["dietLabels"],
          image: hit["recipe"]["image"]
        recipes << wrapper
      end
    end
    return recipes
  end
end
