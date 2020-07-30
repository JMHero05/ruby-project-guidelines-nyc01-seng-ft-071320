class RemoveAllColumnsFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :name
    remove_column :users, :zipcode
  end
end
