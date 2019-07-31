class AddColumnToMedicines < ActiveRecord::Migration
  def change
    add_column :medicines, :expired_at, :date
  end
end
