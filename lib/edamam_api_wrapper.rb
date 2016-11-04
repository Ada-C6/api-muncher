require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?"
  BASE_URI = "http://www.edamam.com/ontologies/edamam.owl%23recipe_"
  # APP_ID =
  # APP_KEY =

  def self.search(search_term, from)
    Dotenv.load

    url = BASE_URL + "app_id=#{ENV["APP_ID"]}" + "&app_key=#{ENV["APP_KEY"]}" + "&q=#{search_term}" + "&from=#{from}"

    data = HTTParty.get(url)
    results = []
    if data["hits"]
      count = data["count"]
      data["hits"].each do |hit|
        wrapper = Recipe.new hit["recipe"]["label"], hit["recipe"]["uri"], url: hit["recipe"]["url"], image_url: hit["recipe"]["image"], ingredients: hit["recipe"]["ingredients"], tags: hit["recipe"]["dietLabels"], summary: hit["recipe"]["summary"], dietary_info:  hit["recipe"]["totalNutrients"]
        # need to add more dietary info above
        results << wrapper
      end
    end
    return results, count
  end

  def self.recipe(uri)
    Dotenv.load

    url = BASE_URL + "app_id=#{ENV["APP_ID"]}" + "&app_key=#{ENV["APP_KEY"]}" + "&r=#{BASE_URI}#{uri}"

    # return url
    data = HTTParty.get(url)
    recipe = Recipe.new data[0]["label"], data[0]["uri"], url: data[0]["url"], image_url: data[0]["image"], ingredients: data[0]["ingredients"], tags: data[0]["dietLabels"], summary: data[0]["summary"], dietary_info:  data[0]["totalNutrients"]
    return recipe
  end
end
