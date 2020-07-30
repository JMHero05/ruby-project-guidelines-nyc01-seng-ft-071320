class AddTicketCountColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :ticket_count, :integer
    add_column :tickets, :ticket_count, :integer
  end
end
