class CreateBloodpressureReadings < ActiveRecord::Migration
  def change
    create_table :bloodpressure_readings do |t|
      t.integer :user_id
      t.integer :systolic_pressure
      t.integer :diastolic_pressure
      t.integer :heart_rate
      t.text :comment

      t.timestamps
    end
  end
end
