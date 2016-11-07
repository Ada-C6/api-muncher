# lib/slack_api_wrapper.rb
require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  URI_BASE = "http://www.edamam.com/ontologies/edamam.owl#recipe_"

  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]

  def self.list_search_results(query)
    url = "#{ BASE_URL }?" + "#{ APP_ID }=" + "#{ APP_KEY }&" + "q=" + "#{ query }" + "&to=40"
    data = HTTParty.get(url)
    search_results_list = []
    if data["hits"]
      data["hits"].each do |result|
        wrapper = SearchResult.new(result["recipe"]["uri"].split(URI_BASE).last, result["recipe"]["label"], result["recipe"]["image"], result["recipe"]["url"], result["recipe"]["dietLabels"], result["recipe"]["healthLabels"], result["recipe"]["ingredientLines"])
        search_results_list << wrapper
      end
    end
    return search_results_list
  end


  # def self.detailed_result
  # end

end
#
