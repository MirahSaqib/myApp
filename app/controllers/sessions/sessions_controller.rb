class Sessions::SessionsController < Devise::SessionsController

  # POST /resource/sign_in
  def create
    admin = User.where(email: (params[:admin][:email]), hospital_id: @current_hospital.id)
    if !admin.first.nil? && admin.first.valid_password?(params[:admin][:password])
      if !session[:user_id].nil?
        flash[:info] = t('sessions.already_signed_in')
        redirect_to admin_dashboard_url(subdomain: @current_hospital.sub_domain)
      elsif @current_hospital.id == admin.first.hospital.id
        flash[:success] = t('sessions.successful_sign_in')
        clean_up_passwords(admin.first)
        sign_in(resource_name, admin.first)
        session[:user_id] = admin.first.id
        session[:hospital_id] = @current_hospital.id
        yield resource if block_given?
        redirect_to admin_dashboard_path
      else
        redirect_to new_admin_session_url, danger: t('sessions.account_not_found')
      end
    else
      flash[:danger] = t('sessions.incorrect_email_or_password')
      redirect_to new_admin_session_path
    end
  end

  # DELETE /resource/sign_out
  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    session[:user_id] = nil
    session[:hospital_id] = nil
    set_flash_message :success, :signed_out if signed_out && is_flashing_format?

    yield if block_given?
    respond_to_on_destroy
  end
end
