# lib/slack_api_wrapper.rb
require `httparty`

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"

  def self.listsearchresults(query)
    url = BASE_URL + "?q=" + query # + "&pretty=1&exclude_archived=1"
    data = HTTParty.get(url)
    search_result_list = []
    if data["search_result"]
      data["search_result"].each do |result|
        wrapper = SearchResult.new search_result["name"], search_result["id"] , purpose: channel["purpose"], is_archived: channel["is_archived"], members: channel["members"]
        search_result_list << wrapper
      end
    end
    return channel_list
  end

end
