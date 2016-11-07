require 'httparty'

class Recipe
  BASE_URL = "https://api.edamam.com/search?q="
  TOKEN = ENV["TOKEN"]
  ID = ENV["ID"]


  def initialize
  end

  def self.all(q,base) #q to and from increment
    basei = 0
    if base != nil
      basei = base.to_i
    end

    url = BASE_URL + "#{q}&app_id=#{ID}&app_key=#{TOKEN}&from=#{basei}&to=#{(basei+10)}"
    data = HTTParty.get(url)
    dataSet = []
    if data["hits"]
        data["hits"].each do |current|
          wrapper = current["recipe"]
          dataSet << wrapper
      end
    end
  return dataSet
  end

  def self.reset; end

  # Return a memoized set of all recipes?

  #Return a single recipe for show page
  def self.find(label, base)
    match = self.all(label, base)
  return match.first
  end
end
