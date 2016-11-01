class Recipe
  attr_reader :label, :uri, :image, :source, :sourceIcon, :sourceUrl, :yield, :healthLabels, :ingredientLines

  def initialize(uri, options = {} )
    @uri = uri
    # Commented out because there's no way I'd be able to remember
    # all this live.
    # @purpose = options[:purpose]
    # @is_archived = options[:is_archived]
    # @is_general = options[:is_archived]
    # @members = options[:members]
  end
  #
  def self.search (search_term)
    EdamamApiWrapper.listrecipes(search_term)
  end
  #
  # def self.by_name
  # end
  #
  # def self.by_keyword
  # end
  #
  # def self.top_10
  # end

end
