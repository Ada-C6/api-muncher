require 'httparty'
# require 'channel'

class EdamamApiWrapper
  ID = ENV["EDAMAM_ID"]
  KEY = ENV["EDAMAM_KEY"]
  BASE_URL = "https://api.edamam.com/"


  def self.list_recipes(search_term)
    url = BASE_URL + "search?app_id=#{ID}" + "&app_key=#{KEY}" + "&q=#{search_term}"

    data = HTTParty.get(url)

    recipes = []
    if data["hits"]  # if the request was successful
      data["hits"].each do |recipe|

        wrapper = Recipe.new(recipe["label"],
                              recipe["id"], {
                              ingredients: recipe["purpose"],
                              health_labels: recipe["healthLabels"],
                              diet_labels: recipe["dietLabels"],
                              instructions: recipe["ingredientLines"],
                              ingredients: recipe["ingredients"]
                              image: recipe["image"]
                              uri: recipe["uri"]
                              })
        recipes << wrapper
      end
     return channels
    else
     return nil
    end

  end


end
