require 'httparty'

# ENV variables aren't consistently loading without this manual call
require 'dotenv'
Dotenv.load

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?q="
  ID = ENV["EDAMAM_APP_ID"]
  KEY = ENV["EDAMAM_APP_KEY"]
  MAX_RESULTS = 1000
  # @todo - refactor to prevent slow load times from huge calls? or leave as is to prevent excess quantity of calls?

  def self.search(term)
    # this method returns entire response from API call

    url = BASE_URL + term.split(" ").join("+") + "&app_id=#{ID}&app_key=#{KEY}&from=0&to=#{MAX_RESULTS}"

    puts "Searching for #{term} with url: #{url}"

    data = HTTParty.get(url)

    return data
  end # self.search

  # @todo - remove if unused
  # def self.search_results(term)
  #   # this method shall call search & return just the results (rather than the whole response)
  #
  #   search_response = search(term)
  #   recipe_results = []
  #
  #   if search_response["hits"]
  #     search_response["hits"].each do |hit|
  #       recipe = hit["recipe"]
  #       recipe_object = Recipe.new(
  #         recipe["label"],
  #         recipe["image"],
  #         recipe["uri"],
  #         recipe["url"],
  #         recipe["calories"],
  #         recipe["ingredients"], # array of JSON ingredient objects
  #         recipe["totalNutrients"] )
  #
  #       recipe_results << recipe_object
  #     end
  #   end # if
  #   return recipe_results
  # end # self.search_results

end # class
