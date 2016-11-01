require 'httparty'

class EdamamApiWrapper
  ID = ENV["APP_ID"]
  KEY = ENV["APP_KEY"]
  BASE_URL = "https://api.edamam.com/"

  def self.search(query)
    url = BASE_URL + "search?app_id=#{ID}&app_key=#{KEY}" + "&q#{query}"

    response = HTTParty.get(url)
    recipes = []
    if response["hits"]
      response["hits"].each do |hit|
        name = hit["recipe"]["label"]
        image = hit["recipe"]["image"]

        recipes << Recipe.new(name, image)
      end
    else
      return nil
    end
    return recipes
  end

end
