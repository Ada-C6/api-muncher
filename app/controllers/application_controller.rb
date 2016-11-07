class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	helper_method :current_user, :signed_in?
	
private
	# def current_user
	# 	@current_user = User.find_by(id: session[:user_id] )
	# end

	def current_user
		@current_user = Identity.find_by(id: session[:user_id] )
	end

	# def require_login
 #  	if current_user.nil?
	#    	flash[:error] = "You must be logged in to view this section"
	#     redirect_to session_path
 #  	end
	# end

	# def signed_in?
 #    !!current_user
	# end


 #  def current_user=(user)
 #    @current_user = user
 #    session[:user_id] = user.nil? ? nil : user.id
 #  end

end
