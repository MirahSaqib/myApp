class AddCategoryToMedicines < ActiveRecord::Migration
  def change
    add_column :medicines, :category, :string
  end
end
