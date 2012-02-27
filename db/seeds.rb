
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
BloodpressureReading.delete_all
500.times do
  BloodpressureReading.create([{
    systolic_pressure: Forgery(:basic).number({:at_least => 100, :at_most => 160}),
     diastolic_pressure: Forgery(:basic).number({:at_least => 50, :at_most => 90}), 
     heart_rate: Forgery(:basic).number({:at_least => 60, :at_most => 160}),
     recorded_at: Forgery(:date).date({:past => true, :max_delta => 1*365}),
     comment: Forgery(:lorem_ipsum).words(10),
     user_id: Forgery(:basic).number({:at_least => 1, :at_most => 10}),
  }])
end