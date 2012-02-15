# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bloodpressure_reading do
    user_id 1
    systolic_pressure 1
    diastolic_pressure 1
    heart_rate 1
    comment "MyText"
  end
end
