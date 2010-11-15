class DrugsController < ApplicationController
  
  respond_to :html, :json
  
  before_filter :find_drug, :except => ['index', 'new', 'create']
  
  def index
    @drugs = Drug.all
  end
  
  def show
    respond_with @drug
  end
  
  def new
    @drug = Drug.new
    respond_with @drug
  end
  
  def create
    @drug = Drug.new(params[:drug])
    if @drug.save
      flash[:notice] = "Successfully created drug record."
      respond_with @drug
    else
      flash[:alert] = "Failed to create drug record."
      render :action => :new
    end
  end
  
  def edit
    respond_with @drug
  end
  
  def update
    if @drug.update_attributes(params[:drug])
      flash[:notice] = "Successfully modified drug record."
      respond_with @drug, :location => drugs_path
    else
      flash[:alert] = "Failed to update drug record."
      render :action => :edit
    end
  end
  
  def destroy
    flash[:alert] = "Successfully removed drug from database." if @drug.delete
    respond_with @drug
  end
  
  def manage_interactions
    
  end
  
  def manage_interactions_update
    params[:drug] ||= {"interactions"=>[""]}
    puts params[:drug]
    if @drug.update_attributes(params[:drug])
      flash[:notice] = "Successfully modified interactions."
      respond_with @drug
    else
      flash[:alert] = "Failed to modify interactions."
      render :action => :manage_interactions
    end
  end
  
  private
  
  def find_drug
    @drug = Drug.find(params[:id])
  end
  
end
