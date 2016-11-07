require 'httparty'
require 'uri'

class ApiMuncherWrapper


  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]
 BASE_URL = "https://api.edamam.com"

  def self.search(term)
    puts "term = #{term}"


      url = BASE_URL + "/search?" + "app_id=#{APP_ID}" + "&app_key=#{APP_KEY}" + "&q=fish&to=100"

      data = HTTParty.get(url)
      hits = []
    

      if data["hits"]
      data["hits"].each do |hit|
        wrapper = MuncherHit.new hit["recipe"]["label"], hit["recipe"]["image"], hit["recipe"]["uri"]
        hits << wrapper

      end

      return hits
    else
      return nil
    end
  end



  def self.show_details(uri)
    uri = URI.escape(uri)
    url = BASE_URL + "/search?" + "app_id=#{APP_ID}" + "&app_key=#{APP_KEY}" + "&r=#{uri}"
    data = HTTParty.get(url)
  end
end




# https://api.edamam.com/search?app_id=0125214c&app_key=52458ad285e3511c0fed3c8bc4fbb8fd&q=fish
