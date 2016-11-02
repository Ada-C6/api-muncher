require 'httparty'

class EdamamApiWrapper

BASE_URL = "https://api.edamam.com/search?q=" #this is always used, so you can keep it constant
  TOKEN = ENV["EDAMAM_TOKEN"]
  APP_KEY = ENV["APP_KEY"]

  def self.results(search_term)
    url = BASE_URL + search_term + "&app_id=#{APP_KEY}&app_key=#{TOKEN}"

    data = HTTParty.get(url) #returns all the results

  #   return data
  # end
  #
    recipes_list = []
    if data["hits"]
      data["hits"].each do |recipe|
        recipe_info = {
        name: recipe["label"],
        photo: recipe["img"],
        url: recipe["url"],
        ingredients: recipe["ingredientLines"],
        dietary_labels: recipe["dietLabels"]
      }
        wrapper = Recipe.new(recipe_info)
        recipes_list << wrapper
      end
    end
    return recipes_list
  end #end results

end #end class
