require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  APP = ENV["EDAMAM_APP_ID"]
  KEY = ENV["EDAMAM_APP_KEY"]

  # TODO: Actually write this method - framework is here. 
  # def self.search(term)
  #   url = BASE_URL + "something with #{APP} and #{KEY} and #{term}"
  #   data = HTTParty.get(url)
  #   search_results_list = []
  #   if data["hits"]
  #     data["hits"].each do |recipe|
  #       wrapper = Recipe.new recipe["label"], recipe["source"]
  #       search_results_list << wrapper
  #     end
  #   end
  #   return search_results_list
  # end

end
