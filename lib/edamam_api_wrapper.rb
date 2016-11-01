require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/"
  SEARCH = "search?q="
  APP_ID = ENV["EDAMAM_APP_ID"]
  APP_KEY = ENV["EDAMAM_APP_KEY"]

  def self.find_recipies(food)
    url = BASE_URL + "search?q=" + "#{food}" + "&app_id=" + APP_ID + "&app_key=" + APP_KEY
    recipe = HTTParty.get(url)
    foods = []
    if recipe["hits"]
      recipe["hits"].each do |hit|
        wrapper = 
      end
    end
  end
end
