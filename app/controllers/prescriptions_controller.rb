class PrescriptionsController < ApplicationController
  def index
    @prescriptions = Prescription.all
  end

  def new
    @prescription = Prescription.new
    respond_to do |format|
      format.html
    end
  end

  def create
    @prescription = Prescription.create(prescription_params)
    # @prescription.doctor_name = params[:prescription][:doctor_name]
    # @prescription.patient_name = params[:prescription][:patient_name]
    @prescription.build_prescription_medicines(params[:prescription][:medicine_tokens], params[:med_quantity])
    redirect_to @prescription, success: 'Prescription created successfully!'
  end

  def edit
    @prescription = Prescription.find(params[:id])
    # @prescription.doctor_name = 'BYE'
    # @prescription.patient_name = 'HELLO'
    respond_to do |format|
      format.html
    end
  end

  def update
    @prescription = Prescription.find(params[:id])
    @prescription.update(prescription_params)
    @prescription.update_prescription_medicines(params[:prescription][:medicine_tokens], params[:med_quantity])
    redirect_to @prescription, success: 'Prescription updated successfully!'
  end

  def show
    @prescription = Prescription.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def destroy
    @prescription = Prescription.find(params[:id])
    @prescription.destroy
    redirect_to prescriptions_path, success: 'Prescription deleted successfully!'
  end

  def on_add_medicine
    @item = params[:item]
    respond_to do |format|
      format.html
      format.js
    end
  end

  def on_delete_medicine
    @item = params[:item]
    respond_to do |format|
      format.html
      format.js
    end
  end

  def prescription_params
    params.require(:prescription).permit!
  end
end
