class ApplicationController < ActionController::Base
  #Allows deviste params to work on a API app
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit::Authorization
  wrap_parameters false
  # protect_from_forgery unless: -> { request.format.json? }
  skip_before_action :verify_authenticity_token
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end
end
