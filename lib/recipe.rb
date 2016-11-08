# lib/recipe.rb
class Recipe
  attr_reader :label, :uri, :image, :yield, :level, :summary, :calories, :ingredientLines, :dietLabels, :healthLabels, :url, :id

  def initialize(label, uri, options = {})
    @label = label
    @uri = uri
    @id = @uri.split("_").last
    @image = options[:image]
    @yield = options[:yield]
    @level = options[:level]
    @summary = options[:summary]
    @calories = options[:calories]
    @ingredientLines = options[:ingredientLines]
    @dietLabels = options[:dietLabels]
    @healthLabels = options[:healthLabels]
    @url = options[:url]

    # Commented out because there's no way I'd be able to remember
    # all this live.
    # @purpose = options[:purpose]
    # @is_archived = options[:is_archived]
    # @is_general = options[:is_archived]
    # @members = options[:members]
  end

  # Create a class-level instance variable.
  # Musch more likely to work as expected than a class variable
  # See http://www.railstips.org/blog/archives/2006/11/18/class-and-instance-variables-in-ruby/
  class << self
    attr_reader :recipes
  end

  # Return a memoized set of all recipes
  def self.search(search_term)
    EdamamApiWrapper.listrecipes(search_term)
  end

  # Foreget all memoized values
  def self.reset
  end

  # Return either the first (probably only) recipe matching
  # the given name, or nil.
  def self.by_name(name)
    matches = all.select do |c|
      c.name == name
    end
    return matches.first
  end

  # Return either the first (probably only) recipe matching
  # the given ID, or nil.
  def self.by_id(id)
    by_id = EdamamApiWrapper.listrecipes(id)
    return by_id.first
  end
end
