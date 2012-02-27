class ApplicationController < ActionController::Base
  include Authentication
  helper :all # include all helpers, all the time

  protect_from_forgery

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

  def sort_column(object)
    object.column_names.include?(params[:sort_by]) ? params[:sort_by] : "recorded_at"
  end

end
