require 'httparty'
require 'uri'

class MuncherApiWrapper
  BASE_URL = "https://api.edamam.com/"
  APP_ID = ENV["MUNCHER_ID"]
  APP_KEY = ENV["MUNCHER_KEY"]

  def self.get_recipes(app_id = nil, app_key = nil, query)
    app_id = APP_ID if app_id == nil
    app_key = APP_KEY if app_key == nil
    url = BASE_URL + "search?" + "&app_id=#{app_id}" + "&app_key=#{app_key}" + "&q=#{query}" + "&from=0&to=100"
    data = HTTParty.get(url)
    # check to see if url is set up correctly to begin troubleshooting

    recipes = []
    if data["hits"].length > 0
      data["hits"].each do |recipe|
        wrapper = Recipe.new(recipe["recipe"]["label"], recipe["recipe"]["image"], recipe["recipe"]["url"], recipe["recipe"]["dietLabels"], recipe["recipe"]["healthLabels"], recipe["recipe"]["ingredientLines"], recipe["recipe"]["uri"])

        recipes << wrapper
      end
      return recipes
    end
  end

  def self.show_recipe(uri)
    url = BASE_URL + "search?" + "&r=#{URI.encode(uri)}"
    response = HTTParty.get(url)

    recipes = []

    response.parsed_response.each do |recipe|
      wrapper = Recipe.new(
        recipe["label"],
        recipe["image"],
        recipe["url"],
        recipe["dietLabels"],
        recipe["healthLabels"],
        recipe["ingredientLines"],
        recipe["uri"])

      recipes << wrapper
    end
    return recipes

  end

end
