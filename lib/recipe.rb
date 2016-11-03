class Recipe
  attr_reader :label, :uri, :image, :source_name, :sourceIcon, :sourceUrl, :yield, :healthLabels, :ingredientLines

  def initialize(label, source_name, uri, options = {} )
    raise ArgumentError if label == nil || label == "" || uri == nil || uri == "" || source_name == nil || source_name == ""

    @label = label
    @source_name = source_name
    @uri = uri
    @image = options[:image]
    @sourceUrl = options[:sourceUrl]
    @yield = options[:yield]
    @healthLabels = options[:healthLabels]
    @ingredientLines = options[:ingredientLines]
  end

  def self.search (search_term)
    #change to ||= if time permits
    EdamamApiWrapper.listrecipes(search_term)
  end

  def self.by_label (label)
    all_matches = []
    matches = search(label)

    # i realize that there are some duplicates that show up here, so I decided to take the first one because that is the one that shows up prior
    #ask if there is a case where this doesn't work!!!
    matches.each do | recipe |
      all_matches << recipe
    end

    return all_matches[0]
  end

  def self.next_ten
  end

end
