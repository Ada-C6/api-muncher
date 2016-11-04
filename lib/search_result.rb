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

  # Create a class-level instance variable.
  # Musch more likely to work as expected than a class variable
  # See http://www.railstips.org/blog/archives/2006/11/18/class-and-instance-variables-in-ruby/
  class << self
    attr_reader :search_results
  end

  def self.all(query)
    results = EdamamApiWrapper.list_search_results(query)
    return results
  end

  # Forget all memoized values
  def self.reset
  end


end
