require 'httparty'

class MuncherApiWrapper
  BASE_URL = "https://api.edamam.com/"
  APP_ID  = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]

  def self.search(app_id=nil, app_key=nil, search_term)
  	app_id ||= APP_ID
  	app_key ||= APP_KEY
  	url = BASE_URL + "search?" + "&app_id=#{app_id}" + "&app_key=#{app_key}"  +"&q=#{search_term}"
  	puts url
  	hits = HTTParty.get(url)["hits"]
  	return hits
  end
end