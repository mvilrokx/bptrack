class User < ActiveRecord::Base
  has_many :bloodpressure_readings
  has_many :authorizations

  store :preferences, accessors: [ :target_systolic, :target_diastolic, :record_heartrate ]

  validates :email, 
    :format => {:with => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i, :message => "Invalid email address." }, 
    :uniqueness => true,
    :allow_blank => true

  def self.create_with_omniauth!(auth)
    create(:user_name => auth['info']['name'])
  end

  def record_heartrate?
    record_heartrate != '0'
  end

end
