class AddAllColumnsToEventsExceptEventName < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :date, :date
    add_column :events, :venue_name, :string
    add_column :events, :venue_address, :string
    add_column :events, :venue_city, :string
    add_column :events, :venue_state, :string
    add_column :events, :postal_code, :string
  end
end
