require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  ESP_BASE_URL = "https://api.edamam.com/search"
  TOKEN = ENV["TOKEN"]

  def self.listrecipes(query)

      url = BASE_URL + "?#{query}" + "app_id=#{ID}" + "&app_key=#{TOKEN}"
      data = HTTParty.get(url)
      recipe_list = []
        if data["recipes"]
          data["recipes"].each do |recipe|
            wrapper = Recipe.new recipe["token"],recipe["id"], q: recipe["label"], recipe["image"], recipe["ingredients"], recipe["dietLabels"], recipe["healthLabels"]
            recipe_list << wrapper
          end
        end
    #return array of ruby objects rather than a hash of non-parsed data
    return recipe_list
  end

  def self.list_esp_recipes(query)
      url = ESP_BASE_URL + "?#{query}" + "app_id=#{ID}" + "&app_key=#{TOKEN}"
      data = HTTParty.get(url)
      recipe_list = []
        if data["recipes"]
          data["recipes"].each do |recipe|
            wrapper = Recipe.new recipe["label"], recipe["image"], is_archived: recipe["url"], members: recipe["members"]
            recipe_list << wrapper
          end
        end
  end

  def self.sendmsg(recipe, msg, token = nil)
    token = TOKEN if token == nil
    puts "Search for a recipe #{query_text} : #{search}"
    url = BASE_URL + "chat.postMessage?" + "token=#{TOKEN}"
    data = HTTParty.post(url,
    #just one way of setting up the hash.. search, recipe required; others chosen
    body:  {
      "query_text" => "#{query_text}",
      "q" => "#{q}",
      "label" => "false",
    },
    :headers => { 'Content-Type' => 'application/x-www-form-urlencoded' })
    data
  end
end
