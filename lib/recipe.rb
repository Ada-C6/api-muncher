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
    attr_accessor :searches_cache, :recipes_cache

    attr_reader :api_call
  end

  def self.baked_searches
    self.all("chicken")
    self.all("ground beef")
    self.all("potato")
  end

  # Return a memoized collection of recipes
  def self.all(term)

    #This caches the search results, on their search term.
    @searches_cache ||= Hash.new

    #This caches the individual recipes, on their ID.
    @recipes_cache ||= Hash.new

    recipes = nil
    if @searches_cache[term] != nil
      @api_call = false
      recipes = @searches_cache[term]
    else
      # do the search, and if you get back something, add the search to the @searches_cache cache, and add the recipes included in the search to the @recipes cache.
      # Right now, I'm just caching everything in the hashes. I would probably want to limit the size of the hashes somehow, or the lifespan of the things that are stored, in case the backend API changes.
      @api_call = true
      recipes = EdamamApiWrapper.search(term)
      if recipes == []
        return []
      else
        @searches_cache[term] = recipes

        recipes.each do |recipe|
          @recipes_cache[recipe.identifier] = recipe
        end
      end
    end

    return recipes
  end

  def self.find_recipe(identifier)
    # Should check and see if this idenfitier already exists in my @recipes and if it doesn't then, call this.
    @recipes_cache ||= Hash.new

    if @recipes_cache[identifier] != nil
      @api_call = false
      return @recipes_cache[identifier]
    end

    # Otherwise, do this.
    recipe = EdamamApiWrapper.find_recipe(identifier)
      if recipe == nil
        return nil
      else
        @recipes_cache[recipe.identifier] = recipe
        @api_call = true
        return recipe
      end
  end
end
