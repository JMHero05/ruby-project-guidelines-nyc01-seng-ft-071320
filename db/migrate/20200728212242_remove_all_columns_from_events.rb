class RemoveAllColumnsFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :event_name
    remove_column :events, :venue
    remove_column :events, :zipcode
    remove_column :events, :date
  end
end
