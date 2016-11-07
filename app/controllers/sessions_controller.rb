class SessionsController < ApplicationController
  # skip_before_action :require_login, only: :create
  # skip_before_filter :verify_authenticity_token, only: :create

	
  def new
  end

  def create
		auth_hash = request.env['omniauth.auth']
    #below is us saying we don't know them (unless they have a uid)
    return redirect to login_failure_path unless auth_hash['uid']

    @identity = Identity.find_by(uid: auth_hash[:uid])
    #github knows them, but do we?  if not, let's make them an account
    if @identity.nil?
      # identity doesn't match anything in the DB.
      # Attempt to create a new identity.
      @identity = Identity.build_from_github_or_google(auth_hash)
      flash[:notice] = "Unable to Save the Identity"
#using method below to save time
      return redirect_to root_path unless @identity.save
      # render :creation_failure unless @identity.save
    end

     # Save the user ID in the session
    session[:user_id] = @identity.id


    # redirect_to sessions_path
#doing this other thing to save time
		flash[:notice] = "Successfully Logged in!"
		redirect_to index_path

  end

#   def destroy
#   	session[:user_id] = nil
#     redirect_to root_path
#   end


  # def create
  # auth = request.env['omniauth.auth']
  # # Find an identity here
  # @identity = Identity.find_with_omniauth(auth)

  # if @identity.nil?
  #   # If no identity was found, create a brand new one here
  #   @identity = Identity.create_with_omniauth(auth)
  # end

  # if signed_in?
  #   if @identity.user == current_user
  #     # User is signed in so they are trying to link an identity with their
  #     # account. But we found the identity and the user associated with it 
  #     # is the current user. So the identity is already associated with 
  #     # this user. So let's display an error message.
  #     redirect_to root_url, notice: "Already linked that account!"
  #   else
  #     # The identity is not associated with the current_user so lets 
  #     # associate the identity
  #     @identity.user = current_user
  #     @identity.save
  #     redirect_to root_url, notice: "Successfully linked that account!"
  #   end
  # else
  #   if @identity.user.present?
  #     # The identity we found had a user associated with it so let's 
  #     # just log them in here
  #     self.current_user = @identity.user
  #     redirect_to root_url, notice: "Signed in!"
  #   else
  #     # No user associated with the identity so we need to create a new one
  #     redirect_to new_user_url, notice: "Please finish registering"
  #   end
  # end

  def destroy
	  self.current_user = nil
	  redirect_to root_url, notice: "Signed out!"
	end
end
