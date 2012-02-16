class AuthorizationsController < ApplicationController

  def destroy
    @authorizations = current_user.authorizations.find(params[:id])
    @authorizations.destroy
    redirect_to edit_user_path, :flash => {:success => "Successfully removed #{@authorizations.provider} account."}
  end

end
