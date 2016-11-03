require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"

  def self.list_recipes(search_term)
    url = BASE_URL + "?q=#{search_term}"
    data ||= HTTParty.get(url).parsed_response

    all_recipes = []
    data["hits"].each do |hit|
      # puts hit
      recipe = {
        label: hit["recipe"]["label"],
        calories: hit["recipe"]["calories"],
        url: hit["recipe"]["url"]
      }
      all_recipes << recipe
    end
    return all_recipes
  end
end
