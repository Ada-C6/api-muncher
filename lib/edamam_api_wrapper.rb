
require 'httparty'
require 'awesome_print'
require 'results.rb'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/"
  APP_ID = ENV["app_id"]
  APP_KEY = ENV["app_key"]

  attr_reader :recipe_name, :recipe_uri#, :purpose, :is_archived, :members

  def initialize( recipe_name, recipe_uri, options = {} )
    @recipe_name = recipe_name
    @recipe_uri = recipe_uri

    # In here write the recipe search thingies
    @image = options[:image]
    # @is_archived = options[:is_archived]
    # @is_general = options[:is_archived]
    # @members = options[:members]
  end

  def self.search_recipes(ingredient, app_id = nil, app_key = nil)
    app_id = APP_ID if app_id == nil
    app_key = APP_KEY if app_key == nil

    url = BASE_URL + "search?app_id=#{app_id}" + "&app_key=#{app_key}"
    puts url
    data = HTTParty.post(url,
      body: {
        "q" => "#{ingredient}"
        # "health" => "#{health}",
        # "diet" => "#{diet}"
        },
      :headers => { 'Content-Type' => 'application/x-www-form-urlencoded' })
  end

  def self.listresults(search)
    url = BASE_URL + "search?app_id=#{APP_ID}" + "&app_key=#{APP_KEY}" + "&q=#{search}"
    data = HTTParty.get(url)
    recipes = []
    if data["hits"]
      data["hits"].each do |hit|
        wrapper = Recipe_Results.new hit["recipe"]["label"], hit["recipe"]["uri"], image: hit["recipe"]["image"]
        recipes << wrapper
      end
      return recipes
    else
      return nil
    end
  end
end
