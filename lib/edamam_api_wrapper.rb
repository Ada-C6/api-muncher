require 'httparty'
require 'awesome_print'
require 'results.rb'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/"
  APP_ID = ENV["app_id"]
  APP_KEY = ENV["app_key"]

  attr_reader :recipe_name, :recipe_uri, :image, :recipes_array, :ingredients, :url, :diet_labels, :health_labels

  def initialize( recipe_name, recipe_uri, image, ingredientLines, url, diet_labels, health_labels )
    @recipe_name = recipe_name
    @recipe_uri = recipe_uri
    @image = image
    @ingredients = ingredientLines
    @url = url
    @diet_labels = diet_labels
    @health_labels = health_labels
  end

  def self.listresults(search,app_id=nil,app_key=nil)
    app_id ||= APP_ID
    app_key ||= APP_KEY
    url = BASE_URL + "search?app_id=#{app_id}" + "&app_key=#{app_key}" + "&q=#{search}" + "&to=100"
    data = HTTParty.get(url)
    @recipes_array = []
    if data["hits"]
      data["hits"].each do |hit|
        wrapper = Recipe_Results.new( hit["recipe"]["label"], hit["recipe"]["uri"], hit["recipe"]["image"],
        hit["recipe"]["ingredientLines"],
        hit["recipe"]["url"],
        hit["recipe"]["dietLabels"],
        hit["recipe"]["healthLabels"] )
        @recipes_array << wrapper
      end
      return @recipes_array
    else
      return nil
    end
  end
end
