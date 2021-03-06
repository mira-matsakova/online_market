class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :phone_number, :password_confirmation, :email, :password).merge(type: 'Buyer')}
    # devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :phone_number, :email, :current_password)}
  end
end
