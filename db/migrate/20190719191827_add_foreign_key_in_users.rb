class AddForeignKeyInUsers < ActiveRecord::Migration
  def change
    add_foreign_key :users, :hospitals, column: :hospital_id
  end
end
