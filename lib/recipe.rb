class Recipe
  attr_reader :label, :source, :identifier, :image, :source_url, :source_icon, :ingredients, :from, :health_labels, :dietary_info

  def initialize(label, source_site, identifier, options = {} )
    @label = label
    @source = source_site
    @identifier = identifier
    @image = options[:image]
    @source_url = options[:source_url]
    @source_icon = options[:source_icon]
    @ingredients = options[:ingredients]
    @from = options[:from]
    @health_labels = options[:health_labels]
    @dietary_info = options[:dietary_info]
  end

  # Create a class-level instance variable.
  # Much more likely to work as expected than a class variable
  # See http://www.railstips.org/blog/archives/2006/11/18/class-and-instance-variables-in-ruby/
  class << self
    attr_accessor :search_term

    attr_reader :recipes, :recipe, :api_call, :chicken_recipes, :potato_recipes, :ground_beef_recipes
  end

  # Return a memoized collection of recipes
  def self.all(term)
    # setting these memoized searches.
    @chicken_recipes ||= EdamamApiWrapper.search("chicken")
    @ground_beef_recipes ||=  EdamamApiWrapper.search("ground beef")
    @potato_recipes ||= EdamamApiWrapper.search("potato")

    case term
    when "chicken"
      @api_call = false
      @recipes = @chicken_recipes
    when "potato"
      @api_call = false
      @recipes = @potato_recipes
    when "ground beef"
      @api_call = false
      @recipes = @ground_beef_recipes
    when @search_term
      # If term is the same, use memoized search.
      @api_call = false
      return @recipes
    else
      # If not any of the above, do the search and set the search_term.
      @recipes = EdamamApiWrapper.search(term)
      @search_term = term
      @api_call = true
    end

    return @recipes
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
