class CreateMedicines < ActiveRecord::Migration
  def change
    create_table :medicines do |t|
      t.string  :name
      t.integer :sale_price
      t.integer :quantity
      t.string  :type
      t.integer :hospital_id

      t.timestamps null: false
    end
  end
end
