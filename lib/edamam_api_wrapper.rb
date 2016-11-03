class EdamamApiWrapper
# Documentation: https://developer.edamam.com/edamam-docs-recipe-api

  BASE_URL = "https://api.edamam.com/"
  KEY = ENV["EDAMAM_KEY"]
  ID  = ENV["EDAMAM_ID"]

  def self.list_recipes(keyword, page)
    url = BASE_URL + "search?q=#{keyword}" + "&app_id=" + ID + "&app_key=" + KEY + "&from=#{(page - 1) * 10}"
    data = HTTParty.get(url)
    recipe_list = []

    if data["hits"]
      data["hits"].each do |recipe_hash|
        recipe = recipe_hash["recipe"]

        wrapper = Recipe.new recipe["label"], image: recipe["image"], original_site: recipe["source"], original_url: recipe["url"], ingredients: recipe["ingredientLines"], diet_labels: recipe["dietLabels"], health_labels: recipe["healthLabels"]

        recipe_list << wrapper
      end
    end

    return recipe_list
  end

end
