
class Recipe
  attr_reader :label, :uri, :ingredients, :diet_labels, :image

  def initialize(label, options = {})
    raise ArgumentError if label == nil || label == ""

    @label = label

    @uri = options[:uri]
    @ingredients = options[:ingredients]
    @diet_labels = options[:diet_labels]
    @image = options[:image]
  end

  def self.all
    EdamamApiWrapper.findrecipes("all")
  end

  def self.find(keyword)
    EdamamApiWrapper.findrecipes(keyword)
  end


end
