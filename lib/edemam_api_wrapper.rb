require 'httparty'

class EdemamApiWrapper
  BASE_URL = "https://api.edamam.com/"
  TOKEN = ENV["TOKEN"]
  APP_ID = ENV["APP_ID"]

  # Need to request a list of recipes given a specified search term
  def self.list_recipes(search_term)
    url = BASE_URL + "search?" + "q=#{search_term}" + "&to=100" + "&app_id=#{APP_ID}" + "&app_key=#{TOKEN}"

    data = HTTParty.get(url)
    recipes = []
    if data["hits"] # if the request was successful we should have recieved "hits" from the api
      # puts = "success"
      data["hits"].each do |hit|
        uri = hit["recipe"]["uri"]
        a = uri.slice!(/h.*_/)
        wrapper = Recipe.new(uri, label: hit["recipe"]["label"], image: hit["recipe"]["image"])
        recipes << wrapper
      end
      return recipes
    else
      return nil
    end

  end

  def self.get_a_recipe(uri)
    url = BASE_URL + "search?" + "r=http://www.edamam.com/ontologies/edamam.owl%23recipe_#{uri}" + "&app_id=#{APP_ID}" + "&app_key=#{TOKEN}"

    data = HTTParty.get(url)

    if data[0]["uri"]
      recipe = Recipe.new(data[0]["uri"], label: data[0]["label"], image: data[0]["image"], source: data[0]["source"], url: data[0]["url"], yield: data[0]["yield"], ingredientLines: data[0]["ingredientLines"], healthLabels: data[0]["healthLabels"])
    else
      return nil
    end
  end

end
