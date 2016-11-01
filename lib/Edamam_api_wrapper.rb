require `httparty`

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/"
  ID = ENV["EDAMAM_RECIPE_SEARCH_ID"]
  KEY = ENV["EDAMAM_RECIPE_SEARCH_AUTH_KEY"]

  def self.recipe_search(search_term)
    url = BASE_URL + "search?q=" + search_term  + "&app_id=" + ID + "&app_key=" +  KEY
    data = HTTParty.get(url)
    if data["params"]
      return data["params"]
    else
      return []
    end
  end

  def self.list_recipies()
    recipe_list = []
    if data["params"]
      data["params"].each do |hit|
        wrapper = Recipe.new hits["recipe"]["name"], recipe["id"] , purpose:  hits["recipe"]["purpose"], is_archived: channel["is_archived"],   members: channel["members"]
        channel_list.push(wrapper)
      end
    end
  return recipe_list
  end

end
