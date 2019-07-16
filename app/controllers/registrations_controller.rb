class RegistrationsController < Devise::RegistrationsController
  def create
    @subdomain= "#{params[:user][:hospital_attributes][:hospital_name]}.localhost:3000"
    h=Hospital.create(hospital_name:params[:user][:hospital_attributes][:hospital_name], sub_domain:@subdomain)
    super
    @user.build_hospital(hospital_name:params[:user][:hospital_attributes][:hospital_name], sub_domain:@subdomain)
    @user.save
  end
  # def new
  #   current_user.build_hospital
  #   super
  # end

  def sign_up_params
    # binding.pry
    params.require(:user).permit(:email, :password, :password_confirmation, hospital_attributes: [:hospital_name, :sub_domain])
  end
end
