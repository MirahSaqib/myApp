class CreatePrescriptionMedicines < ActiveRecord::Migration
  def change
    create_table :prescription_medicines do |t|
      t.integer :quantity
      t.integer :hospital_id
      t.integer :prescription_id
      t.integer :medicine_id

      t.timestamps null: false
    end
  end
end
