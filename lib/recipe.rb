class Recipe


  attr_reader :name, :id, :health_labels, :ingredients, :uri, :yield, :nutrients

  def initialize(name, id, options = {} )
    @name = name
    @id = id

    if name==nil || id==nil || name=='' || id==''
    	raise ArgumentError
    end

    @purpose = options[:purpose]
    @is_archived = options[:is_archived]
    @is_general = options[:is_archived]
    @members = options[:members]
  end

end