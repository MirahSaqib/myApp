require 'date'

class MedicinesController < ApplicationController
  def index
    @medicines = Medicine.not_expired.order(:name)
    @med = @medicines.where("name like ?", "%#{params[:q]}%")
    @med.each do |medicine|
      medicine.name = "#{medicine.name} (#{medicine.category})"
    end
    respond_to do |format|
      format.html { @medicines = Medicine.all }
      format.json { render json: @med }
      format.js { @medicines = Medicine.all }
    end
  end

  def new
    @medicine = Medicine.unscoped.new
    respond_to do |format|
      format.html
    end
  end

  def create
    @medicine = Medicine.unscoped.new(medicine_params).unscope
    @medicine.hospital_id = @current_hospital.id
    if @medicine.save
      redirect_to @medicine, success: t('medicines.created')
    else
      flash[:danger] = t('medicines.not_created')
      render :new
    end
  end

  def edit
    @medicine = Medicine.not_expired.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def update
    @medicine = Medicine.not_expired.find(params[:id])
    if @medicine.update(medicine_params)
      redirect_to @medicine, success: t('medicines.updated')
    else
      flash[:danger] = t('medicines.not_updated')
      render :edit
    end
  end

  def show
    @medicine = Medicine.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def destroy
    @medicine = Medicine.not_expired.find(params[:id])
    @medicine.destroy
    redirect_to medicines_path, success: t('medicines.deleted')
  end

  def medicine_params
    params.require(:medicine).permit!
  end

  def expire
    @medicine = Medicine.not_expired.find(params[:id])
    @medicine.update(expired_at: Date.today)
    redirect_to medicines_path, success: t('medicines.expired')
  end
end
