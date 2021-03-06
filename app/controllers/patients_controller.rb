class PatientsController < ApplicationController
  
  respond_to :html, :json
  
  before_filter :find_patient, :except => ['index', 'new', 'create']
  
  def index
    @patients = Patient.all
  end
  
  def show
    @drugs = @patient.drugs
    @interactions = @patient.drugs.interacts_with(@patient.drugs)
    #puts @interactions
    @allergic = @patient.drugs.allergies_to(@patient.drugs, @patient.allergies)
    #puts @allergic
    respond_with @patient

  end
  
  def new
    @patient = Patient.new
    respond_with @patient
  end
  
  def create
    @patient = Patient.new(params[:patient])
    if @patient.save
      flash[:notice] = "Successfully created patient record."
      respond_with @patient, :location => patient_path(@patient)
    else
      flash[:alert] = "Failed to create patient record."
      render :action => :new
    end
  end
  
  def edit
    respond_with @patient
  end
  
  def update
    if @patient.update_attributes(params[:patient])
      flash[:notice] = "Successfully modified patient record."
      respond_with @patient, :location => patient_path(@patient)
    else
      flash[:alert] = "Failed to update patient record."
      render :action => :edit
    end
  end
  
  def destroy
    flash[:alert] = "Successfully removed patient record." if @patient.delete
    respond_with @patient
  end
  
  private
  
  def find_patient
    @patient = Patient.find(params[:id])
  end
  
end
