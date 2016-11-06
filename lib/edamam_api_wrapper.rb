require 'httparty'

class EdamamApiWrapper
  ID = ENV["EDAMAM_ID"]
  KEY = ENV["EDAMAM_KEY"]
  BASE_URL = 'https://api.edamam.com/search?'

  def self.search_recipe(search_term)
    url = BASE_URL + "q=#{search_term}" + "&app_id=#{ID}" + "&app_key=#{KEY}"
    data = HTTParty.get(url)

    return data["hits"]
  end

  def self.list_recipes
    recipes = []
    data["hits"].each do |hit|
      wrapper = Recipe.new(
      label: hit["recipe"]["label"],
      url: hit["recipe"]["url"],
      ingredients: hit["recipe"]["ingredients"],
      diet_labels: hit["recipe"]["dietLabels"],
      image: hit["recipe"]["image"]
      )
      recipes << wrapper
    end
    return recipes
  end
end
