require 'httparty'
# require 'channel'
require 'uri'
require 'awesome_print'

class EdamamApiWrapper
  EDAMAM_ID = ENV["EDAMAM_ID"]
  EDAMAM_KEY = ENV["EDAMAM_KEY"]
  BASE_URL = "https://api.edamam.com/"


  def self.list_recipes(search_term, from = 0, to = 10)
    if !search_term.nil?
      search_term = URI.encode(search_term) # add %20 to spaces
    end

    url = BASE_URL + "search?app_id=#{EDAMAM_ID}" + "&app_key=#{EDAMAM_KEY}" + "&q=#{search_term}" + "&from=#{from}" + "&to=#{to}"

    data = HTTParty.get(url)

    # ap data

    recipes = []
    if data["hits"]  # if the request was successful

      data["hits"].each do |recipe|
        wrapper = Recipe.new(recipe["recipe"]["label"], URI.encode(recipe["recipe"]["uri"].to_s), {
                      url: recipe["recipe"]["url"],
                      health_labels: recipe["recipe"]["healthLabels"],
                      diet_labels: recipe["recipe"]["dietLabels"],
                      cautions: recipe["recipe"]["cautions"],
                      instructions: recipe["recipe"]["ingredientLines"],
                      ingredients: recipe["recipe"]["ingredients"],
                      image: recipe["recipe"]["image"],
                      edamam_url: recipe["recipe"]["shareAs"],
                      servings: recipe["recipe"]["yield"],
                      calories: recipe["recipe"]["calories"],
                      source: recipe["recipe"]["source"],
                      count: data["count"] #Only getting this for list_recipes
                      })
        recipes << wrapper
      end
     return recipes
    else
     return nil
    end

  end

  def self.get_recipe(recipe_id)
    url = BASE_URL + "search?app_id=#{EDAMAM_ID}" + "&app_key=#{EDAMAM_KEY}" + "&r=#{recipe_id}"
    recipe = HTTParty.get(url)

    # ap recipe

    return Recipe.new(recipe[0]["label"], URI.encode(recipe[0]["uri"].to_s), {
                  url: recipe[0]["url"],
                  health_labels: recipe[0]["healthLabels"],
                  diet_labels: recipe[0]["dietLabels"],
                  cautions: recipe[0]["cautions"],
                  instructions: recipe[0]["ingredientLines"],
                  ingredients: recipe[0]["ingredients"],
                  image: recipe[0]["image"],
                  edamam_url: recipe[0]["shareAs"],
                  servings: recipe[0]["yield"],
                  calories: recipe[0]["calories"],
                  source: recipe[0]["source"],
                  nutrition_info: recipe[0]["digest"],  # Currently only getting this for the individual recipes
                  })
  end

  def self.total_recipes(search_term)
    if !search_term.nil?
      search_term = URI.encode(search_term) # add %20 to spaces
    end

    url = BASE_URL + "search?app_id=#{EDAMAM_ID}" + "&app_key=#{EDAMAM_KEY}" + "&q=#{search_term}"

    data = HTTParty.get(url)

    if data["count"]  # if the request was successful
      total = data["count"]
      return total
    else
     return nil
    end

  end


end
