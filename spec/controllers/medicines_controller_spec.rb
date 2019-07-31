require 'rails_helper'

RSpec.describe MedicinesController, :type => :controller do

  ############# new #############
  describe "GET new" do
    it "has a 200 status code" do
      get :new
      expect(response.status).to eq(200)
    end
  end

  ############# edit #############
  describe "GET edit" do
    it "has a 200 status code" do
      get :edit
      expect(response.status).to eq(200)
    end
  end

  ############# create #############
  describe "POST create" do
    context "with valid attributes" do
      it "creates a new medicine" do
        expect{
          post :create, medicine: FactoryGirl.attributes_for(:medicine)
        }.to change(Medicine,:count).by(1)
      end
      
      it "redirects to the new medicine" do
        post :create, medicine: FactoryGirl.attributes_for(:medicine)
        response.should redirect_to Medicine.last
      end
    end
    
    context "with invalid attributes" do
      it "does not save the new medicine" do
        expect{
          post :create, medicine: FactoryGirl.attributes_for(:invalid_medicine)
        }.to_not change(Medicine,:count)
      end
      
      # it "re-renders the new method" do
      #   post :create, medicine: FactoryGirl.attributes_for(:invalid_medicine)
      #   response.should render_template :new
      # end
    end 
  end

  ############# update #############
  describe "PUT update" do
    before :each do
      @medicine = FactoryGirl.create(:medicine)
    end

    context "valid attributes" do
      it "located the requested @medicine" do
        put :update, id: @medicine, medicine: FactoryGirl.attributes_for(:medicine)
        assigns(:medicine).should eq(@medicine)      
      end
    
      it "changes @medicine's attributes" do
        put :update, id: @medicine, 
          medicine: FactoryGirl.attributes_for(:medicine, sale_price: 400, quantity: 40)
        @medicine.reload
        @medicine.sale_price.should eq(400)
        @medicine.quantity.should eq(40)
      end
    
      it "redirects to the updated medicine" do
        put :update, id: @medicine, medicine: FactoryGirl.attributes_for(:medicine)
        response.should redirect_to @medicine
      end
    end

    context "invalid attributes" do
      it "locates the requested @medicine" do
        put :update, id: @medicine, medicine: FactoryGirl.attributes_for(:invalid_medicine)
        assigns(:medicine).should eq(@medicine)      
      end
      
      it "does not change @medicine's attributes" do
        put :update, id: @medicine, 
          medicine: FactoryGirl.attributes_for(:medicine, sale_price: nil, quantity: nil)
        @medicine.reload
        @medicine.sale_price.should_not eq(400)
        @medicine.quantity.should_not eq(40)
      end
      
      it "re-renders the edit method" do
        put :update, id: @medicine, medicine: FactoryGirl.attributes_for(:invalid_medicine)
        response.should render_template :edit
      end
    end
  end

  ############# destroy #############
  describe 'DELETE destroy' do
    before :each do
      @medicine = FactoryGirl.create(:medicine)
    end
    
    it "deletes the medicine" do
      expect{
        delete :destroy, id: @medicine        
      }.to change(Medicine,:count).by(-1)
    end
      
    it "redirects to medicines#index" do
      delete :destroy, id: @medicine
      response.should redirect_to medicines_url
    end
  end

  ############# index #############
  describe "GET index" do
    before :each do
      @medicine = FactoryGirl.create(:medicine)
    end

    it "populates an array of medicines" do
      get :index
      assigns(:medicines).should eq([@medicine])
    end
    
    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  ############# show #############
  describe "GET show" do
    before :each do
      @medicine = FactoryGirl.create(:medicine)
    end

    it "assigns the requested medicine to @medicine" do
      get :show, id: @medicine
      assigns(:medicine).should eq(@medicine)
    end
    
    it "renders the #show view" do
      get :show, id: @medicine
      response.should render_template :show
    end
  end
end