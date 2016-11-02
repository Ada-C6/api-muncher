class Recipe
  attr_reader :label, :source, :uri, :image, :source_url, :source_icon

  def initialize(label, source_site, uri, options = {} )
    @label = label
    @source = source_site
    @uri = uri
    @image = options[:image]
    @source_url = options[:source_url]
    @source_icon = options[:source_icon]
  end

  # Create a class-level instance variable.
  # Much more likely to work as expected than a class variable
  # See http://www.railstips.org/blog/archives/2006/11/18/class-and-instance-variables-in-ruby/
  class << self
    attr_reader :recipes
  end

  # Return a memoized set of all channels
  def self.all(term)
    
    # @recipes ||= EdamamApiWrapper.search(term)
    @recipes = EdamamApiWrapper.search(term)
  end
end
