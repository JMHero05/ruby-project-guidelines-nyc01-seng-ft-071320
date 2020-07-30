class AddAllColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :password, :string
    add_column :users, :name, :string
    add_column :users, :postal_code, :string
  end
end
