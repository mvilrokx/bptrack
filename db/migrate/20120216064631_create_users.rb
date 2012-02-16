class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.string :gender
      t.string :mobile_phone
      t.timestamps
    end
  end
end
