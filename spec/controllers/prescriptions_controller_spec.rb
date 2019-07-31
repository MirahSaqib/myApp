require 'rails_helper'

RSpec.describe PrescriptionsController, :type => :controller do
  describe "GET new" do
    it "has a 200 status code" do
      get :new
      expect(response.status).to eq(200)
    end
  end

  describe "GET edit" do
    it "has a 200 status code" do
      # get :edit
      # expect(response).to have_http_status(:success)
    end
  end

   describe "DELETE destroy" do
    it "has a 200 status code" do
      # get :edit
      # expect(response).to have_http_status(:success)
    end
  end
end