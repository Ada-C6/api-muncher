class SearchResult
  attr_reader :id, :label, :image, :url, :diet_labels, :health_labels, :ingredients

  def initialize(id, label, image, url, diet_labels, health_labels, ingredients)
    @id = id
    @label = label
    @image = image
    @url = url
    @diet_labels = diet_labels
    @health_labels = health_labels
    @ingredients = ingredients
  end

  def self.all(query)
    results = EdamamApiWrapper.list_search_results(query)
    return results
  end
end
