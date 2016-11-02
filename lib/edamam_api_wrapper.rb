require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]

  def self.search(search_term)
    url = BASE_URL + "?q=" + search_term + "&app_id=#{ APP_ID }&app_key=#{ APP_KEY }"
    data = HTTParty.get(url)
    results = []
    if data["hits"]
      data["hits"].each do |hit|
        recipe_hash = {
          name: hit["recipe"]["label"],
          photo: hit["recipe"]["image"],
          original_link: hit["recipe"]["url"],
          ingredients: hit["recipe"]["ingredientLines"],
          diet_labels: hit["recipe"]["dietLabels"]
        }
        wrapper = Recipe.new(recipe_hash)
        results << wrapper
      end
    end
    return results
  end
end
