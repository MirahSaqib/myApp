class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # def current_hospital
  #   Hospital.find_by_subdomain! request.subdomain
  # end

  # helper_method :current_hospital

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:user) { |u| u.permit(:email, :password, hospital_attributes: [:id, :hospital_name, :sub_domain]) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, hospital_attributes: [:id, :hospital_name, :sub_domain]) }
  end
end