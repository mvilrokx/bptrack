class BloodpressureReadingsController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_filter :login_required
  respond_to :html, :json
  
  def index
  	@bp_readings = current_user.bloodpressure_readings.paginate(:page => params[:page], :per_page => params[:per_page]||30).order(sort_column(BloodpressureReading) + " " + sort_direction)
    respond_with @bp_readings
  end

  def new
  	@bp_reading = BloodpressureReading.new
  end

  def create
  	@bp_reading = current_user.bloodpressure_readings.new(params[:bloodpressure_reading])
    if @bp_reading.save
      redirect_to bloodpressure_readings_path, :flash => {:success => "Successfully saved BP reading."}
    else
      render :action => 'new', :notice => "An error occured during saving, please re-enter."
    end
  end

  def edit
    @bp_reading = current_user.bloodpressure_readings.find(params[:id])
  end

  def update
    @bp_reading = current_user.bloodpressure_readings.find(params[:id])    
    if @bp_reading.update_attributes(params[:bloodpressure_reading])
      redirect_to bloodpressure_readings_path, :flash => {:success => "Successfully updated BP reading."}
    else
      render :action => 'edit', :notice => "An error occured during saving, please re-enter."
    end
  end

  def destroy
    @bp_reading = current_user.bloodpressure_readings.find(params[:id])
    @bp_reading.destroy
    redirect_to bloodpressure_readings_path, :flash => {:success => "Successfully deleted BP reading."}
  end

end
