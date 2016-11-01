class EdamamApiWrapper

  BASE_URL = "https://api.edamam.com/"
  TOKEN_ID = ENV["EDAMAM_TOKEN_ID"]
  TOKEN_KEYS = ENV["EDAMAM_TOKEN_KEYS"]

   def self.listrecipes(keyword)
     url = BASE_URL + "search?q=#{ keyword }" + "&app_id=#{ TOKEN_ID }" + "&app_key=#{ TOKEN_KEYS }"
   end

end
