require 'httparty'
require 'awesome_print'
require 'results.rb'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/"
  APP_ID = ENV["app_id"]
  APP_KEY = ENV["app_key"]

  attr_reader :recipe_name, :recipe_uri, :image, :recipes_array, :ingredients, :url #, :purpose, :is_archived, :members

  def initialize( recipe_name, recipe_uri, image, ingredientLines, url, options = {} )
    @recipe_name = recipe_name
    @recipe_uri = recipe_uri
    @image = image
    @ingredients = ingredientLines
    @url = url
    # @is_archived = options[:is_archived]
    # @is_general = options[:is_archived]
    # @members = options[:members]
  end

  def self.listresults(search)
    url = BASE_URL + "search?app_id=#{APP_ID}" + "&app_key=#{APP_KEY}" + "&q=#{search}"
    data = HTTParty.get(url)
    @recipes_array = []
    if data["hits"]
      data["hits"].each do |hit|
        wrapper = Recipe_Results.new( hit["recipe"]["label"], hit["recipe"]["uri"], hit["recipe"]["image"],
        hit["recipe"]["ingredientLines"],
        hit["recipe"]["url"] )
        @recipes_array << wrapper
      end
      return @recipes_array
    else
      return nil
    end
  end
end
