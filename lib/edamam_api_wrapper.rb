require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?"
  # APP = ENV["EDAMAM_APP_ID"]
  # KEY = ENV["EDAMAM_APP_KEY"]

  def self.search(term)
    #For some reason, my .env is not getting loaded, so this is the ugly workaround.
    Dotenv.load

    url = BASE_URL + "q=#{term}" + "&app_id=#{ENV["EDAMAM_APP_ID"]}" + "&app_key=#{ENV["EDAMAM_APP_KEY"]}"

    # right now, I'm only getting the first 10 back. 
    data = HTTParty.get(url)
    search_results_list = []
    if data["hits"]
      # return data["hits"]
      data["hits"].each do |item|
        wrapper = Recipe.new( item["recipe"]["label"], item["recipe"]["source"], item["recipe"]["uri"],
        image: item["recipe"]["image"],
        source_url: item["recipe"]["url"],
        source_icon: item["recipe"]["sourceIcon"])
        search_results_list << wrapper
      end
    end
    return search_results_list
  end

end
