class RegistrationsController < Devise::RegistrationsController

  def create
    if Hospital.new(hospital_name: params[:admin][:hospital_attributes][:hospital_name], sub_domain: params[:admin][:hospital_attributes][:sub_domain]).valid?
      super
      # User.where(email: params[:admin][:email]).update_all(role: 'admin')
    else
      redirect_to new_admin_registration_path
    end
  end

  def sign_up_params
    params.require(:admin).permit(:name, :email, :password, :password_confirmation, hospital_attributes: %i[hospital_name sub_domain])
  end
end
