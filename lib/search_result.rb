class SearchResult
  attr_reader

  def initialize(label, image, url, diet_labels, health_labels, ingredients)
    @label = label
    @image = image
    @url = url
    @diet_labels = diet_labels
    @health_labels = health_labels
    @ingredients = ingredients
    
  end


end
