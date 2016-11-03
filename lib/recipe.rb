
class Recipe
  attr_reader :label, :uri, :ingredients, :diet_labels, :image, :url

  def initialize(label, options = {})
    raise ArgumentError if label == nil || label == ""

    @label = label

    @uri = options[:uri]
    @ingredients = options[:ingredients]
    @diet_labels = options[:diet_labels]
    @image = options[:image]
    @url = options[:url]

  end

  # yeah so it turns out "all" does not do what I think it does. Haha.
  # def self.all
  #   EdamamApiWrapper.findrecipes("all")
  # end

  def self.search(keyword, startindex = 0) #gives possibility of looking at the next ten hits.
    startindex = startindex.to_i
    EdamamApiWrapper.searchrecipes(keyword, startindex, (startindex+10))
  end

  def self.find(id)
    EdamamApiWrapper.find(id)
  end


end
