class AddAllColumnsToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :event_name, :string
    add_column :events, :attraction, :string
    add_column :events, :date, :date
    add_column :events, :venue, :string
    add_column :events, :address, :string
    add_column :events, :postal_code, :string
  end
end
