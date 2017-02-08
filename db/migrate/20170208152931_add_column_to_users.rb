class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :role_id, :string
  end
end
