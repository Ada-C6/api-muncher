class Recipe
  attr_reader :label, :uri, :url, :image_url, :ingredients, :dietary_info

  def initialize(label, uri, options = {})
    raise ArgumentError if label == nil || label == "" || uri == nil || uri == ""

    @label = label
    @uri = uri.split(/[_]/).last
    @url = options[:url]
    @image_url = options[:image_url]
    @ingredients = options[:ingredients].map do |i|
      i["text"]
    end
    @dietary_info = options[:dietary_info]
  end

  class << self
    attr_reader :results, :count # this hasn't been set anywhere yet, but will be when we memoize it below?
  end

  def self.search(search_term, page = nil)
    if page == nil
      from = 0
      to = 10
    else
      from = page.to_i * 10
      to = from + 10
    end
    results_array = EdamamApiWrapper.search(search_term, from, to)
    @results = results_array[0]
    @count = results_array[1]
  end

end
