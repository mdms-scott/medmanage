class MedicationsController < ApplicationController
  
  respond_to :html, :json
  
  before_filter :find_medication, :except => ['new', 'create']
  
  def new
    @medication = Medication.new
    @medication.patient_id = params[:patient_id]
    
    respond_with @medication
  end
  
  def create
    @medication = Medication.new(params[:medication])
    if @medication.save
      flash[:notice] = "Successfully created prescription."
      respond_with @medication, :location => patient_path(Patient.where("id = ?", @medication.patient_id).first)
    else
      flash[:alert] = "Failed to create prescription."
      render :action => :new
    end
  end
  
  def edit
    respond_with @medication
  end
  
  def update
    if @medication.update_attributes(params[:medication])
      flash[:notice] = "Successfully modified prescription information."
      respond_with @medication, :location => patient_path(Patient.where("id = ?", @medication.patient_id).first)
    else
      flash[:alert] = "Failed to update prescription information."
      render :action => :edit
    end
  end
  
  def destroy
    flash[:alert] = "Successfully removed prescription information." if @medication.delete
    respond_with @medication, :location => patient_path(Patient.where("id = ?", @medication.patient_id).first)
  end
  
  private
  
  def find_medication
    @medication = Medication.find(params[:id])
  end
  
end
