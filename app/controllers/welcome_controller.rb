class WelcomeController < ApplicationController
  def index
    @page = params[:page].to_i
  end

end
