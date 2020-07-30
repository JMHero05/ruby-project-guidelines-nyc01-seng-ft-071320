require_relative '../config/environment'
require 'pry'

User.delete_all

# USER STORIES

# As a User I want to purchase tickets to events - def reserve ticket
# As a User I want events suggested to me - def suggested
# As a User I want to see what I have tickets to already - def reservations


<<<<<<< HEAD
cli = CLI.new

user1 = User.create(username: "1234", password: "1234", name: "Jake Mills", postal_code: "10002")



=======
user1 = User.create(username: "1234", password: "1234", name: "Jake Mills", postal_code: "10002")

cli = CLI.new
>>>>>>> second_repo



binding.pry

