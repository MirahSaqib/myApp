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
    devise_parameter_sanitizer.for(:user) { |u| u.permit(:name, :role, :email, :password, hospital_attributes: [:id, :hospital_name, :sub_domain]) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :role, :email, :password, hospital_attributes: [:id, :hospital_name, :sub_domain]) }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :type, :role, :password, hospital_attributes: [:id, :hospital_name, :sub_domain]) }
  end

  #before_filter :check_url_hit

  # def check_url_hit
  #   if(request.subdomain.empty? || current_hospital.nil?)
  #     redirect_to root_url
  #   else
  #     redirect_to new_user_session_url(subdomain: request.subdomain)
  #   end
  # end
  
  around_filter :scope_current_hospital

  private

  def current_hospital
    #binding.pry
    #check_url_hit
    Hospital.find_by_sub_domain!(request.subdomain) unless request.subdomain.empty?

  end

  helper_method :current_hospital

  def scope_current_hospital
    Hospital.current_id = current_hospital.id unless current_hospital.nil?
    # binding.pry
    yield
  ensure
    Hospital.current_id = nil
  end

  #before_filter :auth_user

  # def auth_user
  #   redirect_to user_session_path
  # end

  # def get_subdomain
  #   @user = current_user
  #   @hospital = Hospital.find(@user.hospital_id)
  #   @hospital.sub_domain
  # end

  # def after_sign_in_path_for(resource)
  #   #binding.pry
  #   @hospital = Hospital.find(resource.hospital_id)
  #   admin_dashboard_path(subdomain: @hospital.sub_domain)
  # end
end