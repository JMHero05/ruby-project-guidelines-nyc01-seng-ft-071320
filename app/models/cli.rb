class CLI

  def self.start
    User.homepage
    # user.welcome
  end

end


# def reserved_tickets
#   tickets = Ticket.all.each {|ticket| ticket.user_id == self.id}
#   binding.pry
#     if tickets == []
#       puts "----------------------------------------------------------------------------------------------"
#       puts "Looks like you don't have tickets."
#       prompt = "Would you like to search for new tickets? Yes or no?"
#       puts prompt
#       puts "----------------------------------------------------------------------------------------------"
#       while user_input = gets.downcase.chomp
#         case
#         when user_input == "yes"
#           self.search_events
#           break
#         when user_input == "no"
#           self.welcome
#           break
#         else
#           puts "Uh oh! Looks like that didn't work."
#           puts prompt
#           puts "----------------------------------------------------------------------------------------------"
#         end
#       end
#     else
#       puts "-----------------------------------------------------------------------------------------------------------------------"
#       puts "You have #{tickets[:ticket_count]} ticket(s) to the event #{tickets[:event_name]}, on #{tickets[:date]} at #{tickets[:venue_name]}t."
#       puts "-----------------------------------------------------------------------------------------------------------------------"
#     end
#   self.welcome
# end