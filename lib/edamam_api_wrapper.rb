require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]

  def self.search(search_term, page)
    start_index = (page - 1) * 10
    url = BASE_URL + "?q=" + search_term + "&from=#{ start_index }&app_id=#{ APP_ID }&app_key=#{ APP_KEY }"
    data = HTTParty.get(url)
    count = data["count"]
    results = []
    if data["hits"]
      data["hits"].each do |hit|
        recipe_hash = {
          name: hit["recipe"]["label"],
          photo: hit["recipe"]["image"],
          original_link: hit["recipe"]["url"],
          ingredients: hit["recipe"]["ingredientLines"],
          diet_labels: hit["recipe"]["dietLabels"],
          uri: hit["recipe"]["uri"]
        }
        wrapper = Recipe.new(recipe_hash)
        results << wrapper
      end
    end
    return count, results
  end

  def self.find(id)
    url = BASE_URL + "?r=http://www.edamam.com/ontologies/edamam.owl%23" + id + "&app_id=#{ APP_ID }&app_key=#{ APP_KEY }"

    wrapper = nil
    recipe_data = HTTParty.get(url)
    if !recipe_data.empty?
      recipe_hash = {
        name: recipe_data[0]["label"],
        photo: recipe_data[0]["image"],
        original_link: recipe_data[0]["url"],
        ingredients: recipe_data[0]["ingredientLines"],
        diet_labels: recipe_data[0]["dietLabels"],
        uri: recipe_data[0]["uri"]
      }
      wrapper = Recipe.new(recipe_hash)
    end
    return wrapper
  end

end
