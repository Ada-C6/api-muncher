require 'httparty'

# ENV variables aren't consistently loading without this manual load:
# require 'dotenv'
# Dotenv.load

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?q="
  ID = ENV["EDAMAM_APP_ID"]
  KEY = ENV["EDAMAM_APP_KEY"]
  MAX_RESULTS = 100

  # this method returns entire response from API call
  def self.search(term)

    url = BASE_URL + term.split(" ").join("+") + "&app_id=#{ID}&app_key=#{KEY}&from=0&to=#{MAX_RESULTS}"

    # debugging text
    puts "Searching for #{term} with url: #{url}"

    data = HTTParty.get(url)

    return data
  end # self.search

end # class
