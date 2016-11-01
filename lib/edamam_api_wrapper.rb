require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?q="
  KEY = ENV["APP_KEY"]
  ID = ENV["APP_ID"]


  def self.listrecipes(search_word)
    url = "#{BASE_URL}" + "#{search_word}" + "&app_id=$#{ID}" + "&app_key=$#{KEY}"
    data = HTTParty.get(url)

    # puts "#{url}"
    # return data
    recipes_list = []

    if data["hits"]
      data["hits"].each do |entry|
        entry["recipe"].each do |recipe|
          wrapper = Recipe.new(recipe["label"]) #{ image: entry["image"], source: entry["source"], ingredients: entry["ingredientLines"], url: entry[:url] } )

          recipes_list << wrapper
        end
      end
    end

    return recipes_list
  end

end
