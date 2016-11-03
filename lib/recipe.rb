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
    attr_reader :recipes, :recipe, :api_call, :search_term
  end

  # Return a memoized collection of recipes
  def self.all(term)

    # If term is the same, use memoized search.
    if term == @search_term
      @api_call = false
      return @recipes

    else
      @recipes = EdamamApiWrapper.search(term)
      @search_term = term
      @api_call = true
      return @recipes
    end
  end

  def self.find_recipe(identifier)
    # Should check and see if this idenfitier already exists in my @recipes and if it doesn't then, call this.

    if @recipes != nil
      @recipes.each do |recipe|
        if recipe.identifier == identifier
          @recipe = recipe
          @api_call = false
          return @recipe
        end
      end
    end

    # Otherwise, do this.
    @recipe = EdamamApiWrapper.find_recipe(identifier)
    @api_call = true
    return @recipe
    # if @recipes.include?(Recipe)
  end
end
