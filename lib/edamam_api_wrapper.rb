require `httparty`

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  TOKEN = ENV["APP_KEY"]
  ID = ENV["APP_ID"]

  attr_reader :search_term

  def initialize(search_term, token = nil)
    @search_term = search_term
    @web_address = web_address

  end

  def self.list_recipes
    token = TOKEN if token == nil
    id = ID if id == nil

    url = BASE_URL + "q=#{search_term}" + "app_id=#{id}" + "app_key=#{token}"
    data = HTTParty.get(url)

    recipes = []
    if data["recipes"]  # if the request was successful
      data["recipes"].each do |recipe|
        label = recipe["label"]
        image = recipe["image"]
        recipes << Recipe_List.new(label, image)
      end
      return recipes
    else
      return nil
    end
  end

  def self.show_recipe
    token = TOKEN if token == nil
    id = ID if id == nil

    url = BASE_URL + "r=#{web_address}" + "app_id=#{id}" + "app_key=#{token}"
    data = HTTParty.get(url)




end
