class Recipe
    attr_reader :name, :image, :url, :ingredients, :dietary_info, :uri

    def initialize(name, image, url, ingredients, dietary_info, uri)
        @name = name
        @image = image
        @url = url
        @ingredients = ingredients
        @dietary_info = dietary_info
        @uri = uri[51..-1]
    end
end
