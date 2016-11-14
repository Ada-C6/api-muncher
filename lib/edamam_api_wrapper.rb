require 'httparty'

class EdamamApiWrapper
  ID = ENV["APP_ID"]
  KEY = ENV["APP_KEY"]
  BASE_URL = "https://api.edamam.com/"

  def self.search(query, id=ID, key=KEY)
    url = BASE_URL + "search?app_id=#{id}&app_key=#{key}&to=100" + "&q=#{query}"

    response = HTTParty.get(url)
    recipes = []
    if response["hits"]
      response["hits"].each do |hit|
        name = hit["recipe"]["label"]
        image = hit["recipe"]["image"]
        uri = hit["recipe"]["uri"]

        recipes << Recipe.new(name, image, uri)
      end
    else
      return nil
    end
    return recipes
  end

  def self.find_recipe(uri)
    url = BASE_URL + "search?app_id=#{ID}&app_key=#{KEY}" + "&r=#{uri}"
    response = HTTParty.get(url)

    if response[0]
      name = response[0]["label"]
      image = response[0]["image"]
      uri = response[0]["uri"]
      url = response[0]["url"]
      ingredients = response[0]["ingredientLines"]
      dietinfo = response[0]["dietLabels"] + response[0]["healthLabels"]
      nutrients = response[0]["digest"]

      Recipe.new(name, image, uri, url, ingredients, dietinfo, nutrients)
    else
      return nil
    end
  end

end
