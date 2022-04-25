class ApplicationController < ActionController::Base
  USERS = {"admin_user" => "admin_password"}
  before_action :authenticate
  before_action :set_locale

  private
    def authenticate
      authenticate_or_request_with_http_digest do |username|
        USERS[username]
      end
    end

    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end

    def default_url_options(options = {})
      { locale: I18n.locale }.merge options
    end

end
