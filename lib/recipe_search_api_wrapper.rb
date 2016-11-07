require 'httparty'
#require 'recipe'
require_relative './recipe'

class RecipeSearchApiWrapper
  # scheme => https/http/ftp
  # host => api.edamam.com
  # path => /search
  # query parameters => "q=#{term}" + "&app_id=#{APP_ID}"
  BASE_URL = "https://api.edamam.com"
  APP_ID = "f8c6af19"
  APP_KEY = "3e974f32b9b7c425a0a6e4bae6e5e131"
  PAGE_SIZE = 9

  def self.search(term, page, health_labels, diet_labels)
    page ||= 1
    page = page.to_i

    from = (page - 1) * PAGE_SIZE
    to = from + PAGE_SIZE


    url = BASE_URL + "/search?" + "q=#{term}" + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEY}" + "&from=#{from}&to=#{to}"

    health_labels.each do |health_label|
      url += "&health=#{health_label}"
    end

    diet_labels.each do |diet_label|
      url += "&diet=#{diet_label}"
    end

    response = HTTParty.get(url)

    recipes = []
    hits = response['hits'] || []
    hits.each do |hit|
      recipes << Recipe.new(hit['recipe'])
    end
    return {
      :recipes => recipes,
      :count => response['count'],
      :more => response['more']
    }
  end

  def self.find(r)
    encoded_url = URI.encode_www_form_component(r)
    url = BASE_URL + "/search?" + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEY}" + "&r=#{encoded_url}"

    puts url

    response = HTTParty.get(url)
    if response == nil
      return nil
    end

    hit = response[0]
    recipe = Recipe.new(hit)
    return recipe

  end

end
