require 'will_paginate/array'


class PagesController < ApplicationController



  def search
    @recipe = params[:label]
    # @uri = params[:uri]
  end


  def index
    @recipe = params[:label]
    @individual_recipe = Recipe.search(@recipe)
    @image = params[:image]
  end

  def show
    @recipe = params[:id]
    # @individual_recipe = params[:id]
    # @label = params[:label]
    @individual_recipe = Recipe.search(@recipe)
  end

private


#params
end
