class BloodpressureReading < ActiveRecord::Base
  belongs_to :user

  validates :systolic_pressure, :diastolic_pressure, :heart_rate,
    :numericality => { :only_integer => true }, :allow_blank => true

  validates :systolic_pressure, :diastolic_pressure,
    :presence => true

  validates :systolic_pressure, :inclusion => { :in => 60..180,
    :message => "%{value} is not a valid Systolic Pressure Reading" }
  validates :diastolic_pressure, :inclusion => { :in => 6..100,
    :message => "%{value} is not a valid Diastolic Pressure Reading" }
  validates :heart_rate, :inclusion => { :in => 25..250,
    :message => "%{value} is not a valid Heart Rate Reading" }, :allow_blank => true
end
