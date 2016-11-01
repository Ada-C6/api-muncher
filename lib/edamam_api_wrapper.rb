require `httparty`

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  TOKEN = ENV["APP_KEY"]
  ID = ENV["APP_ID"]

  attr_reader :search_term, :web_address

  def initialize(token = nil)

  end

  def self.list_recipes(search_term)
    token = TOKEN if token == nil
    id = ID if id == nil

    url = BASE_URL + "q=#{search_term}" + "app_id=#{id}" + "app_key=#{token}"
    data = HTTParty.get(url)

    recipes = []
    if data["hits"]["recipe"]  # if the request was successful
      data["hits"]["recipe"].each do |recipe|
        label = recipe["label"]
        image = recipe["image"]
        url = recipe["url"]
        health_labels = recipe["healthLabels"]
        ingredients = recipe["ingredients"]["text"]
        recipes << Recipe_List.new(label, image, url, health_labels, ingredients)
      end
      return recipes
    else
      return nil
    end
  end

  def self.show_recipe(web_address)
    token = TOKEN if token == nil
    id = ID if id == nil

    url = BASE_URL + "r=#{web_address}"
    data = HTTParty.get(url)

  end


end
