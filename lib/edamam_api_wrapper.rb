require 'httparty'

class EdamamApiWrapper

BASE_URL = "https://api.edamam.com/search?q=" #this is always used, so you can keep it constant
  TOKEN = ENV["EDAMAM_TOKEN"]
  APP_KEY = ENV["APP_KEY"]

  def self.search(search_term)
    url = BASE_URL + search_term + "&app_id=#{APP_KEY}&app_key=#{TOKEN}"

    data = HTTParty.get(url) #returns all the results

    recipes_list = []
    if data["hits"]
      data["hits"].each do |recipe|
        recipe_info = {
        name: recipe["recipe"]["label"],
        photo: recipe["recipe"]["image"],
        url: recipe["recipe"]["url"],
        ingredients: recipe["recipe"]["ingredientLines"],
        dietary_labels: recipe["recipe"]["dietLabels"],
        calories: recipe["recipe"]["calories"],
        # summary: recipe["recipe"]["summary"]
      }
        wrapper = Recipe.new(recipe_info)
        recipes_list << wrapper
      end
    end
    return recipes_list
  end #end results

end #end class
