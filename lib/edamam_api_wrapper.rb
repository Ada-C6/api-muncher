require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?"
  # APP_ID =
  # APP_KEY =

  def self.search(search_term, from, to)
    Dotenv.load

    url = BASE_URL + "app_id=#{ENV["APP_ID"]}" + "&app_key=#{ENV["APP_KEY"]}" + "&q=#{search_term}" + "&from=#{from}&to=#{to}"

    data = HTTParty.get(url)
    results = []
    if data["hits"]
      count = data["count"]
      data["hits"].each do |hit|
        wrapper = Recipe.new hit["recipe"]["label"], hit["recipe"]["url"], image_url: hit["recipe"]["image"], ingredients: hit["recipe"]["ingredients"], dietary_info:  hit["recipe"]["dietLabels"]
        # need to add more dietary info above
        results << wrapper
      end
    end
    return results, count
  end

end
