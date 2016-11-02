class EdamamApiWrapper
  KEY = ENV["EDAMAM_KEY"]
  ID = ENV["EDAMAM_ID"]
  BASE_URL = "https://api.edamam.com/"

  def self.listrecipes(searchterm)
  url = BASE_URL + "search?q=" + "#{ searchterm }" + "&app_id=#{ ID }" + "&app_key=#{ KEY }" + "&from=0&to=100"
  data = HTTParty.get(url)
  # data["hits"]["to"].to_i = data["hits"]["count"].to_i
  recipe_list = []
  if data["hits"]
    data["hits"].each do |recipe_hash|
      recipe = recipe_hash["recipe"]
      wrapper = Recipe.new recipe["label"], image: recipe["image"], url: recipe["url"], ingredients: recipe["ingredientLines"], calories: recipe["calories"],
        difficultylevel: recipe["level"], healthlabels: recipe["healthLabels"], dietlabels: recipe["dietLabels"], servings: recipe["yield"]
      recipe_list << wrapper
    end
  end
  return recipe_list
  end
end
