require 'httparty'

class EdamamApiWrapper

  BASE_URL = "https://api.edamam.com/search"
  ID = ENV["EDAMAM_ID"]
  KEY = ENV["EDAMAM_KEY"]


  def self.searchrecipes(keyword, startindex, endindex)
    puts "Finding recipes with this keyword: #{keyword}"

    url = BASE_URL + "?q=" + keyword + "&app_id=#{ID}" + "&app_key=#{KEY}" + "&from=#{startindex}" + "&to=#{endindex}"
    data = HTTParty.get(url)
    recipes = []

    if data["hits"]
      data["hits"].each do|hit|
        wrapper = Recipe.new hit["recipe"]["label"],
          uri: hit["recipe"]["uri"],
          label: hit["recipe"]["label"],
          ingredients: hit["recipe"]["ingredientLines"],
          diet_labels: hit["recipe"]["dietLabels"],
          health_labels: hit["recipe"]["healthLabels"],
          image: hit["recipe"]["image"],
          url: hit["recipe"]["shareAs"],
          calories: hit["recipe"]["totalNutrients"]["ENERC_KCAL"],
          servings: hit["recipe"]["yield"],
          nutrients: hit["recipe"]["digest"],
          daily: hit["recipe"]["totalDaily"]

        recipes << wrapper
      end
    end
    return recipes
  end

  def self.find(id)
    puts "Finding a single recipe whose uri is known"
    url = BASE_URL + "?" + "app_id=#{ID}" + "&app_key=#{KEY}" + "&r=http://www.edamam.com/ontologies/#{id}"
    data = HTTParty.get(url)
    wrapper = Recipe.new data[0]["label"],
      uri: data[0]["uri"],
      ingredients: data[0]["ingredientLines"],
      diet_labels: data[0]["dietLabels"],
      health_labels: data[0]["healthLabels"],
      image: data[0]["image"],
      url: data[0]["shareAs"],
      calories: data[0]["totalNutrients"]["ENERC_KCAL"],
      servings: data[0]["yield"],
      nutrients: data[0]["digest"],
      daily: data[0]["totalDaily"]

    return wrapper
  end

end
