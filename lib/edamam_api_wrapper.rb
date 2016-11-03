require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]

  def self.listrecipes(search_term)
    url = BASE_URL + "?q=#{search_term}" + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEY}"
    data = HTTParty.get(url)
    recipe_list = []

    if data["hits"]
      data["hits"].each do | hit |

        recipe_data = {
          image: hit["recipe"]["image"],
          sourceIcon: hit["recipe"]["sourceIcon"],
          sourceUrl: hit["recipe"]["url"],
          yield: hit["recipe"]["yield"],
          dietLabels: hit["recipe"]["dietLabels"],
          healthLabels: hit["recipe"]["healthLabels"],
          ingredientLines: hit["recipe"]["ingredientLines"]
        }
        
        wrapper = Recipe.new(hit["recipe"]["label"], hit["recipe"]["source"], hit["recipe"]["uri"], recipe_data)
        recipe_list << wrapper
      end
    end

    return recipe_list
  end
end
