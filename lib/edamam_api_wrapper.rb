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
      ingredients = recipe["recipe"]["ingredients"]
      recipes << RecipeList.new(label, image, uri, health_labels, ingredients)
    end
    return recipes
  end

  def self.show_recipe(search_term)
    # search_term = search_term.gsub!('#','%23')
    url = BASE_URL + "?r=#{search_term}"
    recipe = HTTParty.get(url).parsed_response
    return recipe.first
    label = recipe["label"]
    # image = recipe["image"]
    # uri = recipe["uri"]
    # diet_labels = recipe["dietLabels"]
    # health_labels = recipe["healthLabels"]
    # ingredient_list = recipe["ingredientLines"]
    # ingredients = recipe["ingredients"]
    # recipes << RecipeList.new(label, image, uri, health_labels, diet_labels, ingredient_list, ingredients)
    # return recipes
  end

end
