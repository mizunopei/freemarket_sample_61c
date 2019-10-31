class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception

  private

  def production?
    Rails.env.production?
  end
  
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username ==　Rails.application.credentials.username  && password == Rails.application.credentials.password
    end
  end
end

