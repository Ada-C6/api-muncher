require 'httparty'
require 'awesome_print'

class Edamam_Api_Wrapper
  # # The BASE_URL is the beginning of every request.
  BASE_URL = "https://api.edamam.com/"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]

  def self.search_recipes(search_term)
    url = BASE_URL + "search" + "?q=#{search_term} + &app_id=#{APP_ID}&app_key=#{APP_KEY}" + "&from=0&to=100"



    data = HTTParty.get(url)

    search_results = []

    data["hits"].each do |hit|
      recipe = hit["recipe"]
      # using recipe to get hash.
      search_results << build_recipe(recipe)
    end
    search_results
  end

# How do convince this param/argument to match what is put in above?
  def self.get_recipe(uri)
    url = BASE_URL + "search" + "?r=#{URI.encode(uri)}"
    recipe = HTTParty.get(url).parsed_response.first
    build_recipe(recipe)
  end


  private

  def self.build_recipe(recipe)
    url = recipe["url"]
    name = recipe["label"]
    photo = recipe["image"]
    uri = recipe["uri"]
    ingredientLines = recipe["ingredientLines"]

    Recipe.new(url, name, photo, uri, ingredientLines)
  end

  # https://api.edamam.com/search?r=http://www.edamam.com/ontologies/edamam.owl%23recipe_637913ec61d9da69eb451818c3293df2




   #
  #  https://api.edamam.com/search?r=http://www.edamam.com/ontologies/edamam.owl%23recipe_637913ec61d9da69eb451818c3293df2


# https://api.edamam.com/search?r=http://www.edamam.com/ontologies/edamam.owl%23 recipe_637913ec61d9da69eb451818c3293df2

# https://api.edamam.com/search?q=chicken&app_id=f2222748&app_key=776b85ac416c71fed03e509eafa77715



end
