require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  ID = ENV["app_id"]
  KEY = ENV["app_key"]

  def self.listrecipes(search_term)
    url = BASE_URL + "q=" + search_term + "&app_id=#{ID}&app_key#{KEY}" #+ "&pretty=1&exclude_archived=1"
    data = HTTParty.get(url)
    recipe_list = []
    if data["recipes"]
      data["recipes"].each do |recipe|
        wrapper = Recipe.new recipe["name"], recipe["id"] , name: recipe["label"], image: recipe["image"], source_url: recipe["url"], diet_labels: recipe["dietLabels"], health_labels: recipe["healthLabels"], cautions: recipe["cautions"], ingredients: recipe["ingredients"]
        recipe_list << wrapper
      end
    end
    return recipe_list
  end


end
