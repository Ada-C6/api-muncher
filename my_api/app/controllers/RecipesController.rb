class RecipesController < ApplicationController
  def index
    @data = Recipes.all
  end

  def create
    RecipesApiWrapper.search(params[:q], params[:message])
    redirect_to root_path
  end

  def new
    @channel_name = params[:q]
  end

  def find
    @data = Channel.find
  end
end


  def create
    result = Channel.by_name(params[:channel]).sendmsg(params[:message])
    if result["ok"]
      flash[:notice] = "Successfully sent message to #{params[:channel]}"
    else
      flash[:notice] = "Failed to send message to #{params[:channel]}: #{result["error"]}"
    end
    redirect_to homepages_index_path
  end

  def new
    @channel_name = params[:channel]
  end
end


private

def product_params
      params.require(:q).permit(:health, :diet, :calories)
    end
