class AdminsController < ApplicationController

  def dashboard
  end

  # def create
  #   #binding.pry
  #   #auth_user if user_signed_in?
  #   if !session[:user_id].nil?
  #     flash[:info] = "You are already signed in!"
  #     #redirect_to after_sign_in_path_for(resource)
  #     #binding.pry
  #     #redirect_to user_session_url, info: "You are already signed in!" 
  #   else
  #     #binding.pry

  #     @user = User.find_by_email(params[:user][:email])
  #     @hospital = Hospital.find(@user.hospital_id)
      
  #     if(request.subdomain.empty?)
  #       flash[:success] = "Signed in Successfully!"
  #         sign_in(resource_name, resource)
  #         session[:user_id] = @user.id
  #         session[:hospital_id] = @hospital.id
  #         #yield resource if block_given?
  #         return redirect_to user_session_path(subdomain: @hospital.sub_domain)

  #     elsif(current_hospital.nil?)
  #       #binding.pry
  #       return redirect_to root_path(subdomain: false)
  #     else

  #       if(current_hospital.id == @hospital.id)
  #         self.resource = warden.authenticate!(auth_options)
          
  #         #binding.pry
  #         #set_flash_message(:success, :signed_in) if is_flashing_format?
  #         flash[:success] = "Signed in Successfully!"
  #         sign_in(resource_name, resource)
  #         session[:user_id] = @user.id
  #         session[:hospital_id] = @hospital.id
  #         yield resource if block_given?
  #         #redirect_to after_sign_in_path_for(resource)
  #         #redirect_to user_session_url, 
  #         #binding.pry
  #       else
  #         redirect_to new_user_session_url, danger: "You do not have an account for this application!"
  #       end
  #     end
  #   end
  # end
end
