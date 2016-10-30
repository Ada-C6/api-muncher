# require 'httparty'
# require 'channel'

class Edamam_Api_Wrapper
  ID = ENV["EDAMAM_ID"]
  KEY = ENV["EDAMAM_KEY"]
  BASE_URL = "https://api.edamam.com/"


  def self.list_recipes(search_term)
    url = BASE_URL + "search?app_id=#{ID}" + "&app_key=#{KEY}" + "&q=#{search_term}"

    response = HTTParty.get(url)
  end


end
