class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # devise_group :user, contains: %i[admin doctor patient]

  add_flash_types :danger, :warning, :info, :success, :alert, :notice

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActiveRecord::RecordNotFound do
    redirect_to page_not_found_url(subdomain: false)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update, &:permit!)
    devise_parameter_sanitizer.for(:sign_up, &:permit!)
  end

  around_filter :scope_current_hospital
  before_filter :scope_sign_up

  private

  def current_hospital
    @current_hospital ||= Hospital.find_by!(sub_domain: request.subdomain) unless request.subdomain.empty?
  end

  helper_method :current_hospital

  def scope_current_hospital
    Hospital.current_id = current_hospital.id unless current_hospital.nil?
    yield
  ensure
    Hospital.current_id = nil
  end

  def authenticate_admin!
    if admin_signed_in?
      super
    else
      redirect_to page_not_found_path
    end
  end

  def scope_sign_up
    unless request.subdomain.empty?
      if request.url.eql?(new_admin_registration_url(subdomain: request.subdomain))
        redirect_to new_admin_registration_url(subdomain: false)
      end
    end
  end
end
