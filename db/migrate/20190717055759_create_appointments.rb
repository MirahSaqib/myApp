class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :status, default: 'pending'
      t.datetime :date_time
      t.integer :patient_id
      t.integer :doctor_id
      t.integer :hospital_id

      t.timestamps null: false
    end
  end
end
