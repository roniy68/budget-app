class ApplicationController < ActionController::Base
  before_action :permitted_parameters, if: :devise_controller?

  protected

  def permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password confirm_password])
  end
end
