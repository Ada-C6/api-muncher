require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?"
  TOKEN = ENV["EDAMAM_CLIENT_ID"]

  def self.search_results(search_term)
    url = BASE_URL + "token=#{TOKEN}" + "&q=#{search_term}"
    results = HTTParty.get(results)
    if results[:hits]
      return results[:hits]
    else
      return "No results found with that search term"
    end
  end

end
