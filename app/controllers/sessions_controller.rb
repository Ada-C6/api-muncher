class SessionsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    # auth_hash = request.env['omniauth.auth']

    auth_hash = request.env['omniauth.auth']
    unless @auth = Authorization.find_from_hash(auth_hash)
      # Create a new user or add an auth to existing user, depending on
      # whether there is already a user signed in.
      @auth = Authorization.create_from_hash(auth_hash, current_user)
    end
    # Log the authorizing user in.
    self.current_user = @auth.user

  end

  def edit
  end

  def update
  end

  def destroy
  end
end
