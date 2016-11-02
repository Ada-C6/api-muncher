require 'httparty'

class EdemamApiWrapper
  BASE_URL = "https://api.edamam.com/"
  TOKEN = ENV["TOKEN"]
  APP_ID = ENV["APP_ID"]

  # def initialize(label, image, rec_source, url)
  #   @label = label
  #   @image = image
  #   @source = rec_source
  #   @url = url
  # end

  # Need to request a list of recipes given a specified search term
  def self.request_recipes(search_term)
    url = BASE_URL + "search?" + "q=#{search_term}" + "&app_id=#{APP_ID}" + "&app_key=#{TOKEN}"

    data = HTTParty.get(url)
    recipes = []
    if data["hits"] # if the request was successful we should have recieved "hits" from the api
      # puts = "success"
      data["hits"].each do |hit|
        wrapper = Recipe.new(hit["recipe"]["label"], hit["recipe"]["image"], hit["recipe"]["source"], hit["recipe"]["url"])
        recipes << wrapper
      end
      return recipes
    else
      return nil
    end

  end


end

  # curl "https://api.edamam.com/search?q=chicken&app_id=${YOUR_APP_ID}&app_key=${YOUR_APP_KEY}"
