class Sessions::SessionsController < Devise::SessionsController
  # before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   # if(current_hospital.nil?)
  #   #   redirect_to root_url(subdomain: false)
  #   # else
  #   #   super
  #   # end
  # end

  # POST /resource/sign_in
  def create
    @admin = User.where(email: (params[:admin][:email]), hospital_id: current_hospital.id)

    if !session[:user_id].nil?
      flash[:info] = 'You are already signed in!'
      redirect_to admin_dashboard_url(subdomain: @hospital.sub_domain)
    elsif current_hospital.id == @admin.first.hospital.id
      self.resource = warden.authenticate!(auth_options)
      flash[:success] = 'Signed in Successfully!'
      sign_in(resource_name, resource)
      session[:user_id] = @admin.id
      session[:hospital_id] = current_hospital.id
      yield resource if block_given?
      redirect_to admin_dashboard_path
    else
      redirect_to new_admin_session_url, danger: 'You do not have an account for this application!'
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

  # protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end

  # def after_sign_in_path_for(resource)
  #   #binding.pry
  #   #user_session_url(subdomain: @hospital.sub_domain)
  # end
end
