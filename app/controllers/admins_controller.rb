class AdminsController < ApplicationController

  before_filter :authenticate_admin!, only: :dashboard

  def dashboard; end
end
