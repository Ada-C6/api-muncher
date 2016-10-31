class Recipe

  def initialize(label, image, options = {} )
    raise ArgumentError if label == nil || label == ""

    @label = label

    @difficulty_level = options[:difficulty_level]
    @image = options[:image]
    @yield = options[:yeild]
    @descriptions = options[:description]
    @ingredients = options[:ingredients]

  end

end
