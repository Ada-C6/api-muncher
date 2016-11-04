require 'will_paginate/array'

class PagesController < ApplicationController
  def home
    # This is to clear previous search_all result
    reset = Recipe.reset_all
  end

  def index
    @recipes ||= Recipe.all(params[:q])

    # paginate json: @recipes, per_page: 10

  end

  def show
    @recipe ||= Recipe.search_by(params[:id])
  end

end
