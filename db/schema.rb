# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

<<<<<<< HEAD
<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2020_07_29_042134) do
=======
ActiveRecord::Schema.define(version: 2020_07_30_195941) do
>>>>>>> second_repo
=======
ActiveRecord::Schema.define(version: 2020_07_30_215848) do
>>>>>>> second_repo

  create_table "events", force: :cascade do |t|
    t.string "event_name"
    t.string "date"
    t.string "venue_name"
    t.string "venue_address"
    t.string "venue_city"
    t.string "venue_state"
    t.string "postal_code"
<<<<<<< HEAD
=======
    t.integer "ticket_count"
>>>>>>> second_repo
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
<<<<<<< HEAD
=======
    t.integer "ticket_count"
>>>>>>> second_repo
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "name"
    t.string "postal_code"
  end

end
