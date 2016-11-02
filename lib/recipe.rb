class Recipe
  # Create a class-level instance variable.
  # Much more likely to work as expected than a class variable
  # See http://www.railstips.org/blog/archives/2006/11/18/class-and-instance-variables-in-ruby/
  class << self; attr_reader :recipes end

  attr_reader :label, :image, :difficulty_level

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
