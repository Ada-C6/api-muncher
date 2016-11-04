class Recipe
  attr_reader :uri, :label, :image, :source, :url, :yield, :ingredientLines, :healthLabels

  def initialize(uri, options = {})
    if uri ==  nil || uri == ""
      raise ArgumentError
    end

    @uri = uri

    @label = options[:label]
    @image = options[:image]
    @source = options[:source]
    @url = options[:url]
    @yield = options[:yield]
    @ingredientLines = options[:ingredientLines]
    @healthLabels = options[:healthLabels]
  end

end
