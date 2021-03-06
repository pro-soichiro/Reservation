class AuthsController < ApplicationController
  skip_before_action :authentication_check
  layout 'users',only: [:new]

  def new
    @auth = Auth.new
  end

  def create
    auth = User.find_by(email: auth_params[:email] )
    if BCrypt::Password.new(auth.password) == auth_params[:password]
      @auth = auth
    end

    unless @auth.nil?
      session[:user_id] = @auth.id
      redirect_to root_path
    else
      redirect_to new_auths_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_auths_path
  end

  private
    def auth_params
      params.require(:auth).permit(:email,:password)
    end

end
