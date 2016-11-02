require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  TOKEN = ENV["APP_KEY"]
  ID = ENV["APP_ID"]

  def self.list_recipes(search_term)
    url = BASE_URL + "?q=#{search_term}" + "&app_id=#{ID}" + "&app_key=#{TOKEN}"
    data = HTTParty.get(url)
    recipes = []
    data["hits"].each do |recipe|
      label = recipe["recipe"]["label"]
      image = recipe["recipe"]["image"]
      url = recipe["recipe"]["url"]
      # health_labels = recipe["healthLabels"]
      # ingredients = recipe["ingredients"]
      recipes << RecipeList.new(label, image, url)
    end
    return recipes
  end

  # def self.show_recipe(web_address)
  #   token = TOKEN if token == nil
  #   id = ID if id == nil
  #
  #   url = BASE_URL + "r=#{web_address}"
  #   data = HTTParty.get(url)
  #
  # end


end
