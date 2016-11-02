require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]

  def self.search(search_term)
    url = BASE_URL + "?q=" + search_term + "&app_id=#{ APP_ID }&app_key=#{ APP_KEY }"
    data = HTTParty.get(url)
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
    return results
  end

  def self.find(id)
    #have to split up the id because the one given un uri is slightly different than the one required for a search `#` must become `%23`
    if id.length > 44 #this is likely a poorly written way to account for the issue described above because if the argument is short, an error is raised for finding its pieces by index below
      url = BASE_URL + "?r=" + id[0..42] + "%23" + id[44..-1] + "&app_id=#{ APP_ID }&app_key=#{ APP_KEY }"
    else
      return nil
    end

    recipe_data = HTTParty.get(url)
    wrapper = nil
    if recipe_data != []
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
