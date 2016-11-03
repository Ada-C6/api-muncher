require 'httparty'

class EdamamApiWrapper

  BASE_URL = "https://api.edamam.com/"
  TOKEN_ID = ENV["EDAMAM_TOKEN_ID"]
  TOKEN_KEYS = ENV["EDAMAM_TOKEN_KEYS"]

   def self.listrecipes(keyword, page)
     url = BASE_URL + "search?q=#{ keyword }" + "&app_id=#{ TOKEN_ID }" + "&app_key=#{ TOKEN_KEYS }" + "&from=#{ (page.to_i - 1) * 10 }"
     data = HTTParty.get(url)
     recipe_list = []
     if data["count"] != nil && data["count"] > 0
       data["hits"].each do |hit|
         wrapper = Recipe.new(hit["recipe"]["label"], hit["recipe"]["image"], hit["recipe"]["uri"], link: hit["recipe"]["url"], ingredients: hit["recipe"]["ingredients"], dietary_info: hit["recipe"]["dietLabels"])
         recipe_list << wrapper
       end
     else
       # TODO
     end
     return recipe_list
   end

   def self.recipe_from_uri(uri)
     url = BASE_URL + "search?r=#{ uri.gsub('#', '%23') }" + "&app_id=#{ TOKEN_ID }" + "&app_key=#{ TOKEN_KEYS }"
     data = HTTParty.get(url)
     puts url
     puts data.count
     recipe_list = []
     if data.count > 0
       recipe = data[0]
       wrapper = Recipe.new(recipe["label"], recipe["image"], recipe["uri"], link: recipe["url"], ingredients: recipe["ingredients"], dietary_info: recipe["dietLabels"])
       recipe_list << wrapper
     else
       # TODO
     end
     return recipe_list
   end
end
