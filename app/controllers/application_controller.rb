class ApplicationController < ActionController::Base
  before_action :authentication_check
  before_action :set_locale

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
