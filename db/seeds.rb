
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
BloodpressureReading.delete_all
test_user = 1
text_comment = "This was entered as test data using seed.rb (rake db:seed)."
100.times do
  BloodpressureReading.create([{
    systolic_pressure: Forgery(:basic).number({:at_least => 100, :at_most => 160}),
     diastolic_pressure: Forgery(:basic).number({:at_least => 50, :at_most => 90}), 
     heart_rate: Forgery(:basic).number({:at_least => 60, :at_most => 160}),
     comment: Forgery(:lorem_ipsum).words(10),
     user_id: test_user
  }])
end