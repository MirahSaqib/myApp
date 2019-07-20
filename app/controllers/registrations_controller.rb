class RegistrationsController < Devise::RegistrationsController

  def create
    if Hospital.new(hospital_name: @hospital_name, sub_domain: @subdomain).valid?
      super
      User.where(email: params[:user][:email]).update_all(role: 'admin')
    else
      redirect_to new_user_registration_path
    end
  end

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, hospital_attributes: %i[hospital_name sub_domain])
  end
end
