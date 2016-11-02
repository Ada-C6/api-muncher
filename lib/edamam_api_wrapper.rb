require `httparty`

class EdamamApiWrapper

BASE_URL = "https://api.edamam.com/search?q=" #this is always used, so you can keep it constant
  TOKEN = ENV["SLACK_TOKEN"]

  def self.results(search)
    url = BASE_URL + search

    data = HTTParty.get(url)

  end 
  # def self.listchannels()
  #   url = BASE_URL + "channels.list?" + "token=#{TOKEN}" + "&pretty=1&exclude_archived=1"
  #   data = HTTParty.get(url)
  #   channel_list = []
  #   if data["channels"]
  #     data["channels"].each do |channel|
  #       wrapper = Channel.new channel["name"], channel["id"] , purpose: channel["purpose"], is_archived: channel["is_archived"], members: channel["members"]
  #       channel_list << wrapper
  #     end
  #   end
  # end
end
