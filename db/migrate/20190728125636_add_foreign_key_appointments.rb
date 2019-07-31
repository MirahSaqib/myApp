class AddForeignKeyAppointments < ActiveRecord::Migration
  def change
    add_foreign_key :appointments, :users, column: :doctor_id
    add_foreign_key :appointments, :users, column: :patient_id
  end
end
