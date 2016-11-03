class Recipe
  attr_reader :label, :source, :identifier, :image, :source_url, :source_icon, :ingredients, :from

  def initialize(label, source_site, identifier, options = {} )
    @label = label
    @source = source_site
    @identifier = identifier
    @image = options[:image]
    @source_url = options[:source_url]
    @source_icon = options[:source_icon]
    @ingredients = options[:ingredients]
    @from = options[:from]
  end

  # Create a class-level instance variable.
  # Much more likely to work as expected than a class variable
  # See http://www.railstips.org/blog/archives/2006/11/18/class-and-instance-variables-in-ruby/
  class << self
    attr_reader :recipes, :recipe
  end

  # Return a memoized collection of recipes
  def self.all(term)
    #TODO: If term is the same, then can use memoized version, but if term isn't, need to make the request again.
    # @recipes ||= EdamamApiWrapper.search(term)
    @recipes = EdamamApiWrapper.search(term)
  end

  def self.find_recipe(identifier)
    # Should check and see if this idenfitier already exists in my @recipes and if it doesn't then, call this.

    if @recipes != nil
      @recipes.each do |recipe|
        if recipe.identifier == identifier
          @recipe = recipe
          return @recipe
        end
      end
    end

    # Otherwise, do this.
    @recipe = EdamamApiWrapper.find_recipe(identifier)
    # if @recipes.include?(Recipe)
  end
end
