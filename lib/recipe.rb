
class Recipe
  attr_reader :label, :uri, :ingredients, :diet_labels

  def initialize(label, options = {})
    raise ArgumentError if name == nil || name == ""

    @label = label

    @uri = options[:uri]
    @ingredients = options[:ingredients]
    @diet_labels = options[:diet_labels]
  end

  def self.all
    @recipes ||= EdamamApiWrapper.listrecipes
  end


end
