class AllergiesController < ApplicationController
  
  respond_to :html, :json
  
  def new
    @allergy = Allergy.new
    @allergy.patient_id = params[:patient_id]

    respond_with @allergy
  end
  
  def create
    @allergy = Allergy.new(params[:allergy])

    if @allergy.save
      flash[:notice] = "Successfully added patient's allergy."
      respond_with @allergy, :location => patient_path(Patient.where("id = ?", @allergy.patient_id).first)
    else
      flash[:alert] = "Failed to add allergy to user."
      render :action => :new
    end
  end
  
  def destroy
    @allergy = Allergy.find(params[:id])
    flash[:alert] = "Successfully removed allergy." if @allergy.delete
    respond_with @allergy, :location => patient_path(Patient.where("id = ?", @allergy.patient_id).first)
  end
  
end
