class AddColumnsToTicketsTable < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :event_name, :string
    add_column :tickets, :date, :string
    add_column :tickets, :venue_name, :string
  end
end
