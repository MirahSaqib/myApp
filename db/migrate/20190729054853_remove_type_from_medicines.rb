class RemoveTypeFromMedicines < ActiveRecord::Migration
  def change
    remove_column :medicines, :type, :string
  end
end
