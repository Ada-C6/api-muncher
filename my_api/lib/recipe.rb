class Recipe < ActiveRecord::Base
  def self.search(query)
      query = "%#{query}%"
      Product.where("name LIKE ? OR description LIKE ?", query, query)
  end
end
