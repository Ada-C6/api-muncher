require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?q="
  ID = ENV["EDAMAM_APP_ID"]
  KEY = ENV["EDAMAM_APP_KEY"]

  def self.search(term)
    # this method returns entire response from API call

    url = BASE_URL + term.split(" ").join("+") + "&app_id=#{ID}&app_key=#{KEY}"

    puts "Searching for #{term} with url: #{url}"

    data = HTTParty.get(url)

    return data
  end # self.search

  def self.search_results(term)
    # this method shall call search & return just the results (rather than the whole response)

    if search(term)["hits"]
      return search(term)["hits"]
    else
      return []
    end # if
  end # self.search_results

end # class
