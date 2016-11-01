require `httparty`

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  TOKEN = ENV["APP_KEY"]
  ID = ENV["APP_ID"]

  def self.list_recipes
    url = BASE_URL + "q=#{@search_term}" + "app_id=#{ID}" + "token=#{TOKEN}"
    data = HTTParty.get(url)

    recipe_list = []
    data["recipes"].each do |recipes|
      label = recipe["label"]
      image = recipe["image"]
      url = recipe["url"]
      recipe_list << Recipe_List.new(label, image, url)
    end
    return recipe_list
  end



end
