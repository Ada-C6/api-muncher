class Recipe
  attr_reader :label, :link, :ingrediants, :dietary, :photo

  def initialize(label, options = {})
    raise ArgumentError if label == nil || label == ""

    @label = label
  end
  #
  def self.search(string)
    # if string
    #   (:all, :conditions => ["@label LIKE ?", "%#{search}%"])
    # else
    #   find(:all)
    #
    # end
    EdamamApiWrapper.search_recipes(string)
  end
  #

  # def self.all
  #
  #   @all = EdamamApiWrapper.all_recipes
  #   return @all
  # end

  # def self.search(string)
  #   match = all.select do |c|
  #     c.label == label
  #
  # end
  #
  # def self.reset
  #   @@recipes = nil
  # end
end
