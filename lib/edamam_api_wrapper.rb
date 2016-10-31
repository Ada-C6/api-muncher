class EdamamApiWrapper
  KEY = ENV["EDAMAM_KEY"]
  ID = ENV["EDAMAM_ID"]
  BASE_URL = "https://api.edamam.com/"

  def self.listrecipes(searchterm)
  url = BASE_URL + "search?q=" + "#{ searchterm }" + "&app_id=#{ EDAMAM_ID }" + "&app_key=#{ EDAMAM_KEY }"
  data = HTTParty.get(url)
  recipe_list = []
  if data["recipes"]
    data["recipes"].each do |recipe|
      # This is how the Slack channel example did it:
      # wrapper = Channel.new channel["name"], channel["id"] , purpose: channel["purpose"], is_archived: channel["is_archived"], members: channel["members"]

      recipe_list << wrapper
    end
  end
  return recipe_list
  end
end
