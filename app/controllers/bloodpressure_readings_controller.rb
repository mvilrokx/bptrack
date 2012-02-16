class BloodpressureReadingsController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  def index
  	@bp_readings = BloodpressureReading.page(params[:page]).order(sort_column(BloodpressureReading) + " " + sort_direction)
  end

  def new
  	@bp_reading = BloodpressureReading.new
  end

  def create
  	@bp_reading = BloodpressureReading.new(params[:bloodpressure_reading])
    if @bp_reading.save
      redirect_to bloodpressure_readings_path, :flash => {:success => "Successfully saved BP reading."}
    else
      render :action => 'new', :notice => "An error occured during saving, please re-enter."
    end
  end

  def edit
    @bp_reading = BloodpressureReading.find(params[:id])
  end

  def update
    @bp_reading = BloodpressureReading.find(params[:id])    
    if @bp_reading.update_attributes(params[:bloodpressure_reading])
      redirect_to bloodpressure_readings_path, :flash => {:success => "Successfully updated BP reading."}
    else
      render :action => 'edit', :notice => "An error occured during saving, please re-enter."
    end
  end



  def destroy
    @bp_reading = BloodpressureReading.find(params[:id])
    @bp_reading.destroy
   redirect_to bloodpressure_readings_path, :flash => {:success => "Successfully deleted BP reading."}
  end

end
