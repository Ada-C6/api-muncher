require `httparty`

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/"
  ID = ENV["EDAMAM_RECIPE_SEARCH_ID"]
  KEY = ENV["EDAMAM_RECIPE_SEARCH_AUTH_KEY"]

  def self.recipe_search(search_term)
    url = BASE_URL + "search?q=" + search_term  + "&app_id=" + ID + "&app_key=" +  KEY
    data = HTTParty.get(url)
    recipe_list = []
    if !data["params"].nil?
      data["params"].each do |hit|
        wrapper = Recipe.new(name: hits["recipe"]["label"], recipe_image:  hits["recipe"]["image"] source_url:  hits["recipe"]["url"], ingredients: hits["recipe"]["ingredientLines"], calories: hits["recipe"]["calories"], dietary_info: hits["recipe"]["digest"], yield: hits["recipe"]["yield"], source: hits["recipe"]["source"], source_icon: hits["recipe"]["souceIcon"])
        recipe_list.push(wrapper)
      end
      return recipe_list
    else
      return []
    end
  end

end
