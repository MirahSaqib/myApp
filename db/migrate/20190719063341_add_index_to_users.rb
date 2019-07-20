class AddIndexToUsers < ActiveRecord::Migration
  def change
    add_index :users, [:email, :hospital_id], unique: true
  end
end
