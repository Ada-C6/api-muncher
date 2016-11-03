class Recipe
  attr_reader :label, :uri, :url, :image_url, :ingredients, :dietary_info

  def initialize(label, uri, options = {})
    raise ArgumentError if label == nil || label == "" || uri == nil || uri == ""

    @label = label
    @uri = uri.split(/[_]/).last
    @url = options[:url]
    @image_url = options[:image_url]
    if options[:ingredients]
      @ingredients = options[:ingredients].map do |i|
        i["text"]
      end
    end
    @dietary_info = options[:dietary_info]
  end

  class << self
    attr_reader :results, :count # this hasn't been set anywhere yet, but will be when we memoize it below?
  end

  def self.search(search_term, page)
    from = (page.to_i - 1) * 10
    results_array = EdamamApiWrapper.search(search_term, from)
    @results = results_array[0]
    @count = results_array[1]
  end

  def self.find(id)
    unless self.results.nil?
      recipe = results.find do |result|
        result.uri == id
      end
      return recipe unless recipe.nil?
    end
    return EdamamApiWrapper.recipe(id)
  end
end
