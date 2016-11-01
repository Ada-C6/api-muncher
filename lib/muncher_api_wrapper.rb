require 'httparty'

class MuncherApiWrapper
  BASE_URL = "https://api.edamam.com/"
  APP_ID  = ENV["API_ID "]
  APP_KEY = ENV["API_KEY"]

  def search(app_id=nil, app_key=nil, search_term)
  	app_id ||= APP_ID
  	app_key ||= APP_KEY
  	url = BASE_URL + "search?" + "app_id=#{app_id}" + "app_key=#{app_key}" + "&pretty=1&exclude_archived=1" +"q=#{search_term}"
  	data = HTTParty.get(url)
  	return data
  end
end