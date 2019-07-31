class PagesController < ApplicationController
  
  def home
    # if Hospital.find_by_sub_domain(request.subdomain).nil?
    #   redirect_to root_url(subdomain: false)
    # end
  end

  def help; end

  def about; end

  def contact; end

  def give_email; end

  def page_not_found
    @error_page = true
  end

  def show_hospitals
    if User.find_by_email(params[:email]).nil?
      return redirect_to give_email_path, danger: 'Incorrect email entered!'
    end

    @hospitals = Hospital.joins(:users).where(users: { email: params[:email] })
  end

  def post_params
    params.require(:post).permit(:email)
  end

  def update_subdomain
    @subdomain = params[:hospital_name].gsub(/\s+/, '')
    if Hospital.find_by_hospital_name(params[:hospital_name])
      @name_error_msg = '(Hospital name already exists!)'
    else
      @name_error_msg = ''
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def get_user_medicines
    @medicines=Hospital.where("hospital_name like ?", "%#{params[:medicine_name]}%")
    respond_to do |format|
      format.html
      format.js
    end
  end
end
