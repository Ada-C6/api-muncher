require "#{Rails.root}/lib/api_wrapper.rb"
require "#{Rails.root}/lib/Muncher_Hit.rb"

class HomepagesController < ApplicationController

  def search


  end



  def list
    @data = paginate ApiMuncherWrapper.search(params[:search]), per_page: 10

  end

  def show
    @recipe = ApiMuncherWrapper.show_details(params[:uri])
  end
end
