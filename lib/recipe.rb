class Recipe
  attr_reader :label, :image, :rec_source, :url

  def initialize(uri, options = {})
    if uri ==  nil || uri == ""
      raise ArgumentError
    end

    @uri = uri

    @label = options[:label]
    @image = options[:image]
    @source = options[:rec_source]
    @url = options[:url]
    @yield = options[:yield]
    @ingredientLines = options[:ingredientLines]
    @healthLabels = options[:healthLabels]
  end

end
