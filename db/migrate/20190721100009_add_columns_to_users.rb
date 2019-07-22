class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :speciality, :string, null: true
    add_column :users, :fees, :integer, null: true
  end
end
