class RemoveAllColumnsExceptEventName < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :attraction
    remove_column :events, :date
    remove_column :events, :venue
    remove_column :events, :address
    remove_column :events, :postal_code
  end
end
