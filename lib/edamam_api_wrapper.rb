require 'httparty'
require 'recipe'

class EdamamApiWrapper
  ID = ENV["EDAMAM_ID"]
  KEY = ENV["EDAMAM_KEY"]
  BASE_URL = "https://api.edamam.com/search?"
  URL_END = "&app_id=#{ID}&app_key=#{KEY}"
#Example url https://api.edamam.com/search?q=chocolate&app_id=a65baf98&app_key=d226eb661cfec1fbf393845bccd84589

  attr_reader :recipe, :label, :uri, :url, :ingredients, :image, :yield, :health_labels, :diet_labels, :from, :to

  def initialize(recipe, options = {} )
    @recipe = recipe

    @uri = options[:uri]
    @label = options[:label]
    @url = options[:url]
    @ingredients = options[:ingredients]
    @image = options[:image]
    @yield = options[:yield]
    @health_labels = options[:health_labels]
    @diet_labels = options[:diet_labels]
  end

  def self.search(q, from, to)

      url = BASE_URL + "q=#{q}" + URL_END + "&from=#{from}&to=#{to}"#this will go to the search results for q
      #get the search results for query q
      data = HTTParty.get(url)
      #if the search results, include hits
      if data["hits"]
      # store all of the hits in search results
        search_results = []
        data["hits"].each do |hit|
          wrapper = Recipe.new hit["recipe"],
           uri: hit["recipe"]["uri"], #this is the unique identifier for the recipe
           label: hit["recipe"]["label"],
           image: hit["recipe"]["image"]

           search_results << wrapper
         end
      end

      return search_results
  end

#new method to show one that works like the search, but use r = uri rather than q = search term
  def self.show_details(r)

      url = BASE_URL + "r=#{URI.encode(r)}" + URL_END
      data = HTTParty.get(url).parsed_response

          recipe = Recipe.new data,
           uri: r, #this is the unique identifier for the recipe
           label: data[0]["label"],
           image: data[0]["image"],
           url: data[0]["url"],
           ingredients: data[0]["ingredientLines"],
           yield: data[0]["yield"],
           health_labels: data[0]["healthLabels"],
           diet_labels: data[0]["dietLabels"]

      return recipe
  end

end
