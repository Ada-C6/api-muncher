require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?q="
  ID = ENV["EDAMAM_APP_ID"]
  KEY = ENV["EDAMAM_APP_KEY"]

  def self.search(term)
    # @todo - remove? unclear purpose
    # id = ID # if id == nil
    # key = KEY # if key == nil

    url = BASE_URL + term + "&app_id=#{ID}&app_key=#{KEY}"

    puts "Searching for #{term} with url: #{url}"

    data = HTTParty.get(url)

    if data["hits"]
      return data["hits"]
    else
      return []
    end # if block

  end # self.search

end # class
