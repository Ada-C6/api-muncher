class EdamamApiWrapper
  KEY = ENV["EDAMAM_KEY"]
  ID = ENV["EDAMAM_ID"]
  BASE_URL = "https://api.edamam.com/"
  URI_BASE = "http://www.edamam.com/ontologies/edamam.owl#recipe_"

  def self.listrecipes(searchterm, page)
  url = BASE_URL + "search?q=" + "#{ searchterm }" + "&app_id=#{ ID }" + "&app_key=#{ KEY }" + "&from=#{ (page.to_i - 1) * 10 }"
  data = HTTParty.get(url)
  recipe_list = []
  if data["hits"]
    data["hits"].each do |recipe_hash|
      recipe = recipe_hash["recipe"]
      wrapper = Recipe.new recipe["label"], recipe["uri"].split(URI_BASE).last, image: recipe["image"], url: recipe["url"], ingredients: recipe["ingredientLines"], calories: recipe["calories"],
        difficultylevel: recipe["level"], healthlabels: recipe["healthLabels"], dietlabels: recipe["dietLabels"], servings: recipe["yield"], fat: recipe["totalNutrients"]["FAT"]["quantity"].to_i,
        satfat: recipe["totalNutrients"]["FASAT"]["quantity"].to_i, trfat: recipe["totalNutrients"]["FATRN"]["quantity"].to_i, carb: recipe["totalNutrients"]["CHOCDF"]["quantity"].to_i,
        fiber: recipe["totalNutrients"]["FIBTG"]["quantity"].to_i, protein: recipe["totalNutrients"]["PROCNT"]["quantity"].to_i
      recipe_list << wrapper
    end
  end
  return recipe_list
  end
end
