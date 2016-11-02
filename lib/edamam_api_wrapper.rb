require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]

  attr_reader :q

  def initialize(q)
    @q = q
  end

  def self.list_recipes(q)

    url = BASE_URL + "?app_id=#{APP_ID}" + "&app_key=#{APP_KEY}" + "&q=#{q}"
    data = HTTParty.get(url)
    recipes = []
    if data["hits"]
      data["hits"].each do |hit|
        wrapper = Recipe.new hit["recipe"]["label"], hit["recipe"]["uri"]
        recipes << wrapper
      end
      print recipes
      return recipes
    end
  end

  def self.get_recipes(q, app_id = nil, app_key = nil)
    app_id = APP_ID if app_id == nil
    app_key = APP_KEY if app_key == nil

    url = BASE_URL + "?app_id=#{app_id}" + "&app_key=#{app_key}"
    puts url
    data = HTTParty.post(url,
               body:  {
                  "q" => "#{q}"
                },
                :headers => { 'Content-Type' => 'application/x-www-form-urlencoded' })
  end

end
