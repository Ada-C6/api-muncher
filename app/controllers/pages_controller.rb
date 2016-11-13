require 'will_paginate/array'


class PagesController < ApplicationController

  def search
    @recipe = params[:label]
  end

  def index
    @recipe = params[:label]
    @individual_recipe = Recipe.search(@recipe).paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @recipe = params[:id]
    @individual_recipe = Recipe.search(@recipe)
  end

end
