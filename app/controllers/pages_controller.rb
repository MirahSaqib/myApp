class PagesController < ApplicationController
  def index
  end

  def show
    # Pages.find_by_subdomain!(request.subdomain)
    # redirect_to root_url(subdomain: page.subdomain)
  end
end
