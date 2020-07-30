class User < ActiveRecord::Base
    has_many :tickets
    has_many :events, through: :tickets

# THIS IS THE START AND THE HOMEPAGE

    def self.homepage
      puts "--------------------------------------------------------------"
      puts "Welcome to TicketMaster - Lite!"
      prompt = "Please enter 'log in' to log in, or enter 'sign up' to create a new account."
      puts prompt
      puts "--------------------------------------------------------------"
        while user_input = gets.downcase.chomp
          case
          when user_input == "log in"
            user = User.login
            break
          when user_input == "sign up"
            user = User.sign_up
            break
          else 
            puts "Uh oh! Looks like that didn't work."
            puts prompt
          end
        end
      user
    end

    # THIS IS WHERE USER LOGS IN

    def self.login
      puts "Username?"
        username = gets.chomp
      puts "Password?"
        password = gets.chomp
      user = User.find_by(username: username, password: password)
        if User.all.include?(user)
        else
          puts "Incorrect username or password. Please enter 'sign up' or 'log in'?"
          while user_input = gets.downcase.chomp
            case
            when user_input == "log in"
              user = User.login
              break
            when user_input == "sign up"
              user = User.sign_up
              break
             else 
               puts "Uh oh! Looks like that didn't work."
               puts prompt
            end   
          end
        end
      user
    end

    # THIS IS WHERE USER SIGNS UP

    def self.sign_up
      puts "Let's get you signed up!"
      puts "What's your first and last name?"
        name = gets.upcase.chomp
      puts "Username?"
        username = gets.chomp
      puts "Password?"
        password = gets.chomp
      puts "Postal Code"
        postal_code = gets.chomp
      user = User.create(username: username, password: password, name: name, postal_code: postal_code)
      user
    end

# SUCCESFUL USER LOG IN WELCOME PAGE

    def welcome
      puts "Welcome #{self.name}!"
      puts "--------------------------------------------------------------"
      prompt = "Would you like to 'view events' or 'view profile'?"
      puts prompt
      while user_input = gets.downcase.chomp
        case
        when user_input == "view events"
          self.events_page
          break
        when user_input == "view profile"
          self.view_profile
          break
        else 
          puts "Uh oh! Looks like that didn't work."
          puts prompt
        end   
      end
    end

    # EVENTS PAGE AND ALL EVENT PAGE SUB METHODS

    def events_page
      puts "--------------------------------------------------------------"
      puts "Welcome to the Events Page! Where we keep you in the know :)"
      puts "--------------------------------------------------------------"
      prompt = "Would you like to 'search events', have us 'suggest events', or quickly see 'events nearby'?"
      puts prompt 
      while user_input = gets.downcase.chomp
        case
        when user_input == "search events"
          self.search_events
          break
        when user_input == "suggest events"
          self.suggest_events
          break
        when user_input == "events nearby"
          self.events_nearby
          break
        else 
          puts "Uh oh! Looks like that didn't work."
          puts prompt
        end   
      end
    end

# SEARCHING EVENTS ----------------------------------------------------------

    def search_events
      puts "--------------------------------------------------------------"
      prompt = "Would like to search by 'venue', search by 'event name', or see all 'events'?"
      puts prompt
      while user_input = gets.downcase.chomp
        case
        when user_input == "venue"
          self.venue
          break
        when user_input == "event name"
          self.event_name
          break
        when user_input == "events"
          self.events
          break
        else 
          puts "Uh oh! Looks like that didn't work."
          puts prompt
        end
      end   
    end

    def venue
      puts Event.events_by_venue
      puts "--------------------------------------------------------------"
      puts "Type the venue you'd like to peruse?"
      name = gets.chomp
      Event.venue_events(name)
      puts "--------------------------------------------------------------"
      prompt = "Would you like to 'reserve' a ticket for one of these events or 'search' another venue, or 'start over' with another search?"
      puts prompt
      while user_input = gets.downcase.chomp
        case
        when user_input == "reserve"
          self.reserve
          break
        when user_input == "search"
          self.venue
          break
        when user_input == "start over"
          self.search_events
          break
        else
          puts "Uh oh! Looks like that didn't work."
          puts prompt
        end
      end
    end

    def event_name
      puts Event.events_by_event_name
      puts "--------------------------------------------------------------"
      puts "Type the event name you'd like to peruse?"
      name = gets.chomp
      Event.name_events(name)
      puts "--------------------------------------------------------------"
      prompt = "Would you like to 'reserve' a ticket for an event or 'search' another event name, or 'start over' with another search?"
      puts prompt
      while user_input = gets.downcase.chomp
        case
        when user_input == "reserve"
          self.reserve
          break
        when user_input == "search"
          self.event_name
          break
        when user_input == "start over"
          self.search_events
          break
        else
          puts "Uh oh! Looks like that didn't work."
          puts prompt
        end
      end
    end

    def events
      Event.all_events
      puts "--------------------------------------------------------------"
      prompt = "Would you like to 'reserve' a ticket for an event above, or 'start over' with another search?"
      puts prompt
      while user_input = gets.downcase.chomp
        case
        when user_input == "reserve"
          self.reserve
          break
        when user_input == "start over"
          self.search_events
          break
        else
          puts "Uh oh! Looks like that didn't work."
          puts prompt
        end
      end
    end

    # SUGGESTED EVENTS --------------------------------------------------------

    def suggest_events
      puts "--------------------------------------------------------------"
      Event.suggested_events
      puts "--------------------------------------------------------------"
      prompt = "Would you like to 'reserve' a ticket for an event above, or 'start over' with another search?"
      puts prompt
      while user_input = gets.downcase.chomp
        case
        when user_input == "reserve"
          self.reserve
          break
        when user_input == "start over"
          self.search_events
          break
        else
          puts "Uh oh! Looks like that didn't work."
          puts prompt
        end
      end
    end

    # EVENTS NEARBY------------------------------------------------------------

    def events_nearby
      puts "--------------------------------------------------------------"
      postal_code = self.postal_code
      Event.postal_code_events(postal_code)
      puts "--------------------------------------------------------------"
      prompt = "Would you like to 'reserve' a ticket for an event, or 'start over' with another search?"
      puts prompt
      while user_input = gets.downcase.chomp
        case
        when user_input == "reserve"
          self.reserve
          break
        when user_input == "start over"
          self.search_events
          break
        else
          puts "Uh oh! Looks like that didn't work."
          puts prompt
        end
      end
    end

    # RESERVE TICKETS----------------------------------------------------------

    def reserve
      puts "--------------------------------------------------------------"
      puts "Which event name?"
      user_input = gets.chomp
      name = user_input
      Event.name_events(name)
    end

    # VIEW PROFILE PAGE AND ALL SUB METHODS

    def view_profile
      puts "--------------------------------------------------------------"
      puts "Welcome to your Profile Page!"
      puts "--------------------------------------------------------------"
      prompt = "Would you like to view your 'user info', see 'reserved tickets', view a 'quirky picture', or 'log out'?"
      puts prompt
       while user_input = gets.downcase.chomp
        case
         when user_input == "user info"
          self.user_info
          break
        when user_input == "reserved tickets"
          self.reserved_tickets
          break
        when user_input == "quirky picture"
          self.quirky_picture
          break
        when user_input == "log out"
          self.log_out
          break
        else 
          puts "Uh oh! Looks like that didn't work."
          puts prompt
        end   
      end
    end

    def user_info
      puts "--------------------------------------------------------------"
      puts "Username: #{self.username}"
      puts "Name: #{self.name}"
      puts "Postal Code: #{self.postal_code}"
      puts "--------------------------------------------------------------"
    end
    # update info?

    # EXTRA USER METHODS

    def reserve_tickets(event, ticket_count)
      Ticket.create(self.id, event.id, ticket_count)
    end
      
    def log_out
      exit
    rescue SystemExit
      puts "See you later #{self.name}! "
    end


    # def reserved_tickets
    #   Ticket.all.select {|ticket| ticket.venue == self}
    # end

    # EVENTS PAGE

    # VIEW PROFILE
      # user info
      # reserved tickets
      # quirky picture

    # RESERVING TICKETS
    # 

end