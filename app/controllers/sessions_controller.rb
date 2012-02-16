class SessionsController < ApplicationController
  
  def create
    auth = request.env["omniauth.auth"]
    authorization = Authorization.find_with_omniauth(auth) || Authorization.create_with_omniauth(auth, current_user)
    session[:user_id] = authorization.user
    redirect_to bloodpressure_readings_path, :flash => {:success => "Signed in succesfully with your #{auth["provider"]} account."}
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :flash => {:success => "Signed out succesfully."}
  end

end
