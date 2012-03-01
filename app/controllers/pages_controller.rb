class PagesController < ApplicationController
  def show
    @page_name = params[:page_name].to_s.gsub(/\W/,'')
  end
end
