class BloodpressureReadingsController < ApplicationController
  def index
  	@bp_readings = BloodpressureReading.page(params[:page]).all
  end
end
