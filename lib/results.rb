
class Recipe_Results
  attr_reader :recipe_name, :id #, :purpose, :is_saved, :members

  def initialize(recipe_name, recipe_uri, options = {} )

    if recipe_name == nil || recipe_uri == nil || recipe_name == "" || recipe_uri == ""
      raise ArgumentError
    end

    @recipe_name = recipe_name
    @recipe_uri = recipe_uri

    @image = options[:image]
    # @is_archived = options[:is_archived]
    # @is_general = options[:is_archived]
    # @members = options[:members]
  end


end
