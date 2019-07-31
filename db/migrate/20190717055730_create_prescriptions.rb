class CreatePrescriptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.string  :disease
      t.text    :description
      t.integer :appointment_id
      t.integer :hospital_id

      t.timestamps null: false
    end
  end
end
