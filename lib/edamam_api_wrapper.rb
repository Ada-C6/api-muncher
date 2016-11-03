require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  TOKEN = ENV["APP_KEY"]
  ID = ENV["APP_ID"]

  def self.list_recipes(search_term, from=nil)

    if from
      from = "&from=#{from}"
    end

    url = BASE_URL + "?q=#{search_term}" + "&app_id=#{ID}" + "&app_key=#{TOKEN}" + "#{from}"
    data = HTTParty.get(url)
    recipes = []
    data["hits"].each do |recipe|
      label = recipe["recipe"]["label"]
      image = recipe["recipe"]["image"]
      uri = recipe["recipe"]["uri"]
      health_labels = recipe["recipe"]["healthLabels"]
      recipes << RecipeList.new(label, image, uri, health_labels)
    end
    return recipes
  end

  def self.show_recipe(r)
    url = BASE_URL + "?r=#{URI.encode(r)}" + "&app_id=#{ID}" + "&app_key=#{TOKEN}"
    data = HTTParty.get(url)
    recipe = RecipeList.new(data[0]["label"], data[0]["image"], data[0]["uri"], data[0]["url"], data[0]["ingredientLines"], data[0]["yield"])
    return recipe

  end

end
