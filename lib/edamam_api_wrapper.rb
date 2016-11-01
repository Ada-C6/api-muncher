require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]

  def self.search(search_term)
    url = BASE_URL + "app_id=#{APP_ID}" + "&app_key=#{APP_KEY}" + "&q=#{search_term}"

    data = HTTParty.get(url)
    results = []
    if data["hits"]
      data["hits"].each do |hit|
        wrapper = Recipe.new hit["recipe"]["label"], hit["recipe"]["url"], image_url: hit["recipe"]["image"], ingredients: hit["recipe"]["ingredients"], dietary_info:  hit["recipe"]["dietLabels"]
        # need to add more dietary info above
        results << wrapper
      end
    end
    return results
  end

end
