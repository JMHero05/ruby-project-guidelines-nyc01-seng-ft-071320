class CreateEvent < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :venue
      t.string :zipcode
      t.date :date
    end
  end
end
