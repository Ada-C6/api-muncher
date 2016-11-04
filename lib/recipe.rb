class Recipe
  attr_reader :label, :uri, :image, :url, :dietLabels, :healthLabels, :cautions, :ingredientLines, :id, :yield

  def initialize(label, uri, options = {})
    raise ArgumentError if label == nil || label == ""

    @label = label
    @uri = uri
    @id = @uri.split("_").last
    @image = options[:image]

    @url = options[:url]
    @dietLabels = options[:dietLabels]
    @healthLabels = options[:healthLabels]
    @cautions = options[:cautions]
    @ingredientLines = options[:ingredientLines]
    @yield = options[:yield]
  end

  def self.search(search_term)
    EdamamApiWrapper.listrecipes(search_term)
  end

  # def self.reset
  #   @@recipes = nil
  # end

  # def self.by_id(uri)
  #   a = EdamamApiWrapper.listrecipes(uri)
  #   b = a.split("_")
  #   return b.last
  # end
end
