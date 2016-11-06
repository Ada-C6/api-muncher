require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  PREFIX = "http://www.edamam.com/ontologies/edamam.owl%23recipe_"
  SUFFIX = "&from="
  KEY = ENV["APP_KEY"]
  ID = ENV["APP_ID"]

  def self.listrecipes(search_word)
    url = "#{BASE_URL}" + "?q=" + "#{search_word}" + "&app_id=#{ID}" + "&app_key=#{KEY}"
    data = HTTParty.get(url)

    recipes_list = []

    if data["hits"].length >= 1
      data["hits"].each do |entry|
        thing = Recipe.new(entry["recipe"]["label"], entry["recipe"]["uri"],
        {
          image: entry["recipe"]["image"],
          source: entry["recipe"]["source"],
          ingredients: entry["recipe"]["ingredientLines"],
          diet_labels: entry["recipe"]["dietLabels"],
          allergy_labels: entry["recipe"]["healthLabels"],
          url: entry["recipe"]["url"]
        } )

        recipes_list << thing
      end
    else
      return nil
    end

    return recipes_list
  end

  def self.listrecipe(id)
    url = "#{BASE_URL}" + "?r=" + "#{PREFIX}" + "#{id}" + "&app_id=#{ID}" + "&app_key=#{KEY}"
    data = HTTParty.get(url)

    if data.length >= 1
      recipe = Recipe.new(data[0]["label"], data[0]["uri"],
      {
        image: data[0]["image"],
        source: data[0]["source"],
        ingredients: data[0]["ingredientLines"],
        diet_labels: data[0]["dietLabels"],
        allergy_labels: data[0]["healthLabels"],
        url: data[0]["url"]
      } )
      return recipe
    else
      return nil
    end
  end

  def self.page(index, search_word)
    url = "#{BASE_URL}" + "?q=" + "#{search_word}" + "&app_id=#{ID}" + "&app_key=#{KEY}" + "#{SUFFIX}" + "#{index}"
    data = HTTParty.get(url)

    recipes_list = []

    if data["hits"]
      data["hits"].each do |entry|
        thing = Recipe.new(entry["recipe"]["label"], entry["recipe"]["uri"],
        {
          image: entry["recipe"]["image"],
          source: entry["recipe"]["source"],
          ingredients: entry["recipe"]["ingredientLines"],
          diet_labels: entry["recipe"]["dietLabels"],
          allergy_labels: entry["recipe"]["healthLabels"],
          url: entry["recipe"]["url"]
        } )
        recipes_list << thing
      end
    end

    return recipes_list
  end


end
