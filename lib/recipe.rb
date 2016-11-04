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

    def self.results(query_term, page)
        return EdamamApiWrapper.search_results(query_term, page)
    end

    # Return either the first (probably only) recipe matching the given name, or nil.
    def self.by_name(query_term, name, page)
        matches = self.results(query_term, page).select do |r|
            r.name == name
        end
        return matches.first
    end
end
