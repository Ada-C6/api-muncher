class PagesController < ApplicationController
  before_action :current_user
  layout "homepage", except: [:favorites]

  def index
  end

  def favorites
  end

end
