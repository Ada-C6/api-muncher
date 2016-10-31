class EdamamApiWrapper
# Documentation: https://developer.edamam.com/edamam-docs-recipe-api

  BASE_URL = "https://api.edamam.com/"
  KEY = ENV["EDAMAM_KEY"]
  ID  = ENV["EDAMAM_ID"]

  def self.keyword_search(keyword)
    url = BASE_URL + "search?q=#{keyword}" + "&app_id=" + ID + "&app_key=" + KEY
    data = HTTParty.get(url)
    recipe_list = []

    if data["hits"]
      data["hits"].each do |recipe_hash|
        recipe = recipe_hash["recipe"]

        wrapper = Recipe.new recipe["label"], difficulty_level: recipe["level"], image: recipe["image"], description: recipe["summary"], yeild: recipe["yield"], ingredients: recipe["ingredients"]

        recipe_list << wrapper
      end
    end

    return recipe_list
  end

  # def self.sendmsg(channel, msg, token = nil)
  #   token = TOKEN if token == nil
  #   puts "Sending message to channel #{channel}: #{msg}"
  #
  #   url  = BASE_URL + "chat.postMessage?" + "token=#{token}"
  #   data = HTTParty.post(url,
  #   body:  {
  #     "text" => "#{msg}",
  #     "channel" => "#{channel}",
  #     "username" => "Bottomless Pit",
  #     "icon_emoji" => ":fries:",
  #     "as_user" => "false"
  #   },
  #   :headers => { 'Content-Type' => 'application/x-www-form-urlencoded' })
  # end


end
