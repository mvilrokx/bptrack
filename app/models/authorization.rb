class Authorization < ActiveRecord::Base
  belongs_to :user

  def self.find_with_omniauth(auth)
    find_by_provider_and_uid(auth['provider'], auth['uid'])
  end

  def self.create_with_omniauth(auth, user = nil)
    user ||= User.create_with_omniauth!(auth)
    Authorization.create(:user => user, :uid => auth['uid'], :provider => auth['provider'])
  end

  SUPPORTED_PROVIDERS = {
  	:google => {:auth_link => '/auth/google_oauth2', :auth_name => 'google_oauth2'},
  	:facebook => {:auth_link => '/auth/facebook', :auth_name => 'facebook'},
  	:twitter => {:auth_link => '/auth/twitter', :auth_name => 'twitter'},
  }

end
