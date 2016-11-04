class Recipe
  attr_reader :label, :id, :image, :url, :ingredients, :calories, :difficultylevel, :healthlabels, :dietlabels, :servings

  def initialize(label, id, options = {} )
    raise ArgumentError if label == nil || label == "" || id == nil || id == ""

    @label = label
    @id = id

    @image = options[:image]
    @url = options[:url]
    @ingredients = options[:ingredients]
    @calories = options[:calories]
    @difficultylevel = options[:difficultylevel]
    @healthlabels = options[:healthlabels]
    @dietlabels = options[:dietlabels]
    @servings = options[:servings]
  end

  # Create a class-level instance variable.
  # Much more likely to work as expected than a class variable
  class << self
    attr_reader :recipes
  end

  def self.all(keyword = nil, page = 0)
    @recipes ||= EdamamApiWrapper.listrecipes(keyword, page)
  end

  def self.reset
    @recipes = nil
  end

  def self.by_id(id)
    self.all.select{ |r| r.id == id }.first
  end


  def self.search(params)
    # Because the Stack Overflow method below wasn't working, I tried to just iterate through the recipes array
    # and return anything that included the search term
    @filtered_recipes = []
    @recipes.each do |recipe|
      if recipe.dietlabels.includes?(params[:search])
        @filtered_recipes << recipe
      end
    end
    return @filtered_recipes
    # Based on googling and stack overflow, I think this is the correct way to write this method???
    # @recipes = @recipes.includes?('dietlabels LIKE?', "%#{params[:search]}%").order('created_at DESC') if params[:search].present?
  end
end
