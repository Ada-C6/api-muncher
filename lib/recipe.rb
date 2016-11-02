class Recipe
  attr_reader :label, :image, :source_url, :diet_labels, :health_labels, :cautions, :ingredients

  def initialize(label)
    raise ArgumentError if label == nil || label == ""

    @label = label
    @image = image

    @source_url = source_url
    @diet_labels = diet_labels
    @health_labels = health_labels
    @cautions = cautions
    @ingredients = ingredients
  end

  def self.search(search_term)
    EdamamApiWrapper.listrecipes(search_term)
  end

  # def self.reset
  #   @@recipes = nil
  # end

end
