class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  add_flash_types :danger, :warning, :info, :success

  before_action :configure_permitted_parameters, if: :devise_controller? 

  rescue_from ActiveRecord::RecordNotFound do
    redirect_to page_not_found_url(subdomain: false)
  end

  protected

  def configure_permitted_parameters
    # devise_parameter_sanitizer.for(:user) { |u| u.permit(:name, :role, :email, :password, hospital_attributes: [:hospital_name, :sub_domain]) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :role, :email, :password, hospital_attributes: [:hospital_name, :sub_domain]) }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :type, :role, :password, hospital_attributes: [:hospital_name, :sub_domain]) }
  end

  around_filter :scope_current_hospital

  private

  def current_hospital
    Hospital.find_by_sub_domain!(request.subdomain) unless request.subdomain.empty?
  end

  helper_method :current_hospital

  def scope_current_hospital
    Hospital.current_id = current_hospital.id unless current_hospital.nil?
    yield
  ensure
    Hospital.current_id = nil
  end

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to page_not_found_path
    end
  end  
end
