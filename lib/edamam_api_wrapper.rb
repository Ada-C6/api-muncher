require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?"
  # APP = ENV["EDAMAM_APP_ID"]
  # KEY = ENV["EDAMAM_APP_KEY"]

  def self.search(term)
    #For some reason, my .env is not getting loaded, so this is the ugly workaround.
    Dotenv.load

    url = BASE_URL + "q=#{term}" + "&app_id=#{ENV["EDAMAM_APP_ID"]}" + "&app_key=#{ENV["EDAMAM_APP_KEY"]}"

    # right now, I'm only getting the first 10 back.
    data = HTTParty.get(url)
    search_results_list = []
    if data["hits"]
      # return data["hits"]
      data["hits"].each do |item|
        wrapper = Recipe.new( item["recipe"]["label"], item["recipe"]["source"], item["recipe"]["uri"].split(/[_]/).last,
        image: item["recipe"]["image"],
        source_url: item["recipe"]["url"],
        source_icon: item["recipe"]["sourceIcon"],
        ingredients: item["recipe"]["ingredientLines"],
        from: "search",
        health_labels: item["recipe"]["healthLabels"],
        dietary_info: item["recipe"]["totalNutrients"]
        )
        search_results_list << wrapper
      end
    else
      return nil
    end
    return search_results_list
  end

  def self.find_recipe(identifier)
    # identifier is the uri that I've chopped up in the search.
    # NOTE: The way that I've chopped up the identifier for the recipe and am reconstructing the uri to send in my request is pretty brittle. If edamam changes their API or the structure of their URLs, this will break.

    #For some reason, my .env is not getting loaded, so this is the ugly workaround.
    Dotenv.load

    # Don't want to make an API call if the identifier is visibly not valid.
    if identifier.class != String || identifier.include?("http://") || identifier.length != 32
      return nil
    end

    url_base = "http://www.edamam.com/ontologies/edamam.owl%23recipe_"

    url = BASE_URL + "r=#{url_base}" + "#{identifier}" + "&app_id=#{ENV["EDAMAM_APP_ID"]}" + "&app_key=#{ENV["EDAMAM_APP_KEY"]}"

    data = HTTParty.get(url)

    # If identifier looks valid, but doesn't return anything, also return nil.
    if data == "[]"
      return nil
    end

      wrapper = Recipe.new(data[0]["label"],
      data[0]["source"],
      data[0]["uri"].split(/[_]/).last,
      image: data[0]["image"],
      source_url: data[0]["url"],
      source_icon: data[0]["sourceIcon"],
      ingredients: data[0]["ingredientLines"],
      from: "find_recipe",
      health_labels: data[0]["healthLabels"],
      dietary_info: data[0]["totalNutrients"]

      )

      return wrapper
  end
end
