class UsersController < ApplicationController
  before_filter :login_required

  def edit
  end

  def update
    if current_user.update_attributes(params[:user])
      redirect_to edit_user_path, :flash => {:success => "Successfully updated your account."}
    else
      render :action => 'edit', :notice => "An error occured during saving, please re-enter."
    end
  end

end
