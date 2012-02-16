class Authorization < ActiveRecord::Base
  belongs_to :user

  def self.find_with_omniauth(auth)
    find_by_provider_and_uid(auth['provider'], auth['uid'])
  end

  def self.create_with_omniauth(auth, user = nil)
    user ||= User.create_with_omniauth!(auth)
    Authorization.create(:user => user, :uid => auth['uid'], :provider => auth['provider'])
  end

end
