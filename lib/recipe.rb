class Recipe

  def initialize(label, options = {} )
    raise ArgumentError if label == nil || label == ""

    @label = label

    @image         = options[:image]
    @original_url  = options[:original_url]
    @ingredients   = options[:ingredients]
    @diet_labels   = options[:diet_labels]
    @health_labels = options[:health_labels]
  end

  # Return a memoized set of all channels
  def self.all(keyword = nil)
    @recipes ||= EdamamApiWrapper.list_recipes(keyword)
  end

  end

end
