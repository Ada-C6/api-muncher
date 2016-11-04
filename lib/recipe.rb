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
    @recipe = order('created_at DESC')
    @recipe = @recipe.where('dietlabels LIKE?', "%#{params[:search]}%").order('created_at DESC') if params[:search].present?
  end
end
