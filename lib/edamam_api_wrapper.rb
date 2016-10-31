require `httparty`

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  TOKEN = ENV["API_KEY"]
  ID = ENV["API_ID"]

end
