class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authentication_check
  before_action :set_locale

  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  private

    def authentication_check
      if session[:user_id] == nil
        redirect_to new_auths_path
      end
    end

    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end

    def default_url_options(options = {})
      { locale: I18n.locale }.merge options
    end

end
