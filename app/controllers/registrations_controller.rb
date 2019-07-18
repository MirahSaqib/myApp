class RegistrationsController < Devise::RegistrationsController
  def create
    @subdomain = params[:user][:hospital_attributes][:hospital_name]
    @hospital_name = params[:user][:hospital_attributes][:sub_domain]
    # binding.pry
    if(Hospital.new(hospital_name:@hospital_name, sub_domain:@subdomain).valid?)
      #super
      build_resource(sign_up_params)

      resource_saved = resource.save
      yield resource if block_given?
      if resource_saved
        if resource.active_for_authentication?
          set_flash_message :success, :signed_up if is_flashing_format?
          sign_up(resource_name, resource)
          respond_with resource, location: after_sign_up_path_for(resource)
        else
          set_flash_message :warning, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        @validatable = devise_mapping.validatable?
        if @validatable
          @minimum_password_length = resource_class.password_length.min
        end
      end
      @user.add_hospital(@hospital_name,@subdomain)
      @user.save
      User.where(email: params[:user][:email]).update_all(role: "Admin")
    else
      redirect_to new_user_registration_path, warning: "Hospital name already exists!"
    end
  end


  def sign_up_params
    # binding.pry
    params.require(:user).permit(:name, :email, :password, :password_confirmation, hospital_attributes: [:hospital_name, :sub_domain])
  end
end