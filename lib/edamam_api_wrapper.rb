require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]

  attr_reader :q, :name

  def initialize(q)
    @q = q
  end

  def self.list_recipes(q, app_id=nil, app_key=nil)
    app_id ||= APP_ID
    app_key ||= APP_KEY

    url = BASE_URL + "?app_id=#{app_id}" + "&app_key=#{app_key}" + "&q=#{q}" + "&to=100"
    data = HTTParty.get(url)
    recipes = []
    if data["hits"]
      data["hits"].each do |hit|
        wrapper = Recipe.new hit["recipe"]["label"], hit["recipe"]["uri"], hit["recipe"]["image"], hit["recipe"]["label"], hit["recipe"]["ingredientLines"], hit["recipe"]["dietLabels"], hit["recipe"]["healthLabels"]
        recipes << wrapper
      end
      return recipes
    end
  end

  def self.find_recipe(id, to = 100)

    url = BASE_URL + "?app_id=#{APP_ID}" + "&app_key=#{APP_KEY}" + "&q=#{id}" + "&to=#{to}"
    data = HTTParty.get(url)
    data["hits"].each do |hit|
      if hit["recipe"]["label"] == id
       @recipe = Recipe.new hit["recipe"]["label"], hit["recipe"]["url"], hit["recipe"]["image"], hit["recipe"]["label"], hit["recipe"]["ingredientLines"], hit["recipe"]["dietLabels"], hit["recipe"]["healthLabels"]
      end
    end
    return @recipe
  end

  # def self.get_recipes(q, app_id = nil, app_key = nil)
  #   app_id = APP_ID if app_id == nil
  #   app_key = APP_KEY if app_key == nil
  #
  #   url = BASE_URL + "?app_id=#{app_id}" + "&app_key=#{app_key}"
  #   puts url
  #   data = HTTParty.post(url,
  #              body:  {
  #                 "q" => "#{q}"
  #               },
  #               :headers => { 'Content-Type' => 'application/x-www-form-urlencoded' })
  # end

end
