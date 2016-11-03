class SessionsController < ApplicationController
  def create
    auth_hash = request.env["omniauth.auth"]

    user = User.create_from_google(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil

    redirect_to root_path
  end
end
