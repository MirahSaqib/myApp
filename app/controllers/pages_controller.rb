class PagesController < ApplicationController

  def home
    # if Hospital.find_by_sub_domain(request.subdomain).nil?
    #   redirect_to root_url(subdomain: false)
    # end
  end

  def help
  end

  def about
  end

  def contact
  end

  def give_email

  end

  def page_not_found
    @error_page = true
  end

  def show_hospitals
  end
end
