
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

  # yeah so it turns out "all" does not do what I think it does. Haha.
  # def self.all
  #   EdamamApiWrapper.findrecipes("all")
  # end

  def self.find(keyword, startindex = 0, endindex = 10) #gives possibility of looking at the next ten hits.
    EdamamApiWrapper.findrecipes(keyword, startindex, endindex)
  end


end
