class Recipe
  attr_reader :label, :url, :image_url, :ingredients, :dietary_info

  def initialize(label, url, options = {})
    raise ArgumentError if label == nil || label == "" || url == nil || url == ""

    @label = label
    @url = url
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
      from = page * 10
      to = from + 10
    end
    results ||= EdamamApiWrapper.search(search_term, from, to)
    @results = results[0]
    @count = results[1]
  end

end
