class User < ActiveRecord::Base
  has_many :tickets
  has_many :events, through: :tickets

  require 'date'

  # THIS IS THE START AND THE HOMEPAGE

  def self.homepage
    puts ASCII.art
    puts '--------------------------------------------------------------------------------'
    puts "Welcome to Scalper's Paradise!"
    prompt =
      "Please enter 'log in' to log in, or enter 'sign up' to create a new account."
    puts prompt
    puts '--------------------------------------------------------------------------------'
    while user_input = gets.downcase.chomp
      case
      when user_input == 'log in'
        user = User.login
        break
      when user_input == 'sign up'
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
    puts 'Username?'
    username = gets.chomp
    puts 'Password?'
    password = gets.chomp
    user = User.find_by(username: username, password: password)
    if User.all.include?(user)
      user.welcome
    else
      puts "Incorrect username or password. Please enter 'sign up' or 'log in'?"
      while user_input = gets.downcase.chomp
        case
        when user_input == 'log in'
          user = User.login
          break
        when user_input == 'sign up'
          user = User.sign_up
          break
        else
          puts "Uh oh! Looks like that didn't work."
          puts prompt
        end
      end
    end
  end

  # THIS IS WHERE USER SIGNS UP

  def self.sign_up
    puts "Let's get you signed up!"
    puts "What's your first and last name?"
    name = gets.upcase.chomp
    puts 'Username?'
    username = gets.chomp
    puts 'Password?'
    password = gets.chomp
    puts 'Postal Code'
    postal_code = gets.chomp
    user =
      User.create(
        username: username,
        password: password,
        name: name,
        postal_code: postal_code
      )
    user.welcome
  end

  # SUCCESFUL USER LOG IN WELCOME PAGE

  def welcome
    puts '--------------------------------------------------------------'
    puts "Welcome #{self.name}!"
    puts '--------------------------------------------------------------'
    prompt = "Would you like to 'view events' or 'view profile'?"
    puts prompt
    while user_input = gets.downcase.chomp
      case
      when user_input == 'view events'
        self.events_page
        break
      when user_input == 'view profile'
        self.view_profile
        break
      else
        puts "Uh oh! Looks like that didn't work."
        puts prompt
        puts '--------------------------------------------------------------'
      end
    end
  end

  # EVENTS PAGE AND ALL EVENT PAGE SUB METHODS

  def events_page
    puts '------------------------------------------------------------------------------------------------'
    puts 'Welcome to the Events Page! Where we keep you in the know :)'
    puts '------------------------------------------------------------------------------------------------'
    prompt =
      "Would you like to 'search events', have us 'suggest events', quickly see 'events nearby', or 'log out'?"
    puts prompt
    while user_input = gets.downcase.chomp
      case
      when user_input == 'search events'
        self.search_events
        break
      when user_input == 'suggest events'
        self.suggest_events
        break
      when user_input == 'events nearby'
        self.events_nearby
        break
      when user_input == 'log out'
        self.log_out
        break
      else
        puts "Uh oh! Looks like that didn't work."
        puts prompt
      end
    end
  end

  # SEARCHING EVENTS ----------------------------------------------------------

  def search_events
    puts '---------------------------------------------------------------------------------'
    prompt =
      "Would you like to search by 'venue', search by 'event name', or see all 'events'?"
    puts prompt
    while user_input = gets.downcase.chomp
      case
      when user_input == 'venue'
        self.venue
        break
      when user_input == 'event name'
        self.event_name
        break
      when user_input == 'events'
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
    puts '--------------------------------------------------------------------------------------------------------------------------------'
    puts "Type the venue you'd like to peruse?"
    name = gets.chomp
    Event.venue_events(name)
    puts '--------------------------------------------------------------------------------------------------------------------------------'
    prompt =
      "Would you like to 'reserve' a ticket for one of these events or 'search' another venue, or 'start over' with another search?"
    puts prompt
    while user_input = gets.downcase.chomp
      case
      when user_input == 'reserve'
        self.reserve
        break
      when user_input == 'search'
        self.venue
        break
      when user_input == 'start over'
        self.events_page
        break
      else
        puts "Uh oh! Looks like that didn't work."
        puts prompt
      end
    end
  end

  def event_name
    puts Event.events_by_event_name
    puts '--------------------------------------------------------------------------------------------------------------------------'
    puts "Type the event name you'd like to peruse?"
    name = gets.chomp
    Event.name_events(name)
    puts '--------------------------------------------------------------------------------------------------------------------------'
    prompt =
      "Would you like to 'reserve' a ticket for an event or 'search' another event name, or 'start over' with another search?"
    puts prompt
    while user_input = gets.downcase.chomp
      case
      when user_input == 'reserve'
        self.reserve
        break
      when user_input == 'search'
        self.event_name
        break
      when user_input == 'start over'
        self.events_page
        break
      else
        puts "Uh oh! Looks like that didn't work."
        puts prompt
      end
    end
  end

  def events
    Event.all_events
    puts '-------------------------------------------------------------------------------------------------'
    prompt =
      "Would you like to 'reserve' a ticket for an event above, or 'start over' with another search?"
    puts prompt
    while user_input = gets.downcase.chomp
      case
      when user_input == 'reserve'
        self.reserve
        break
      when user_input == 'start over'
        self.events_page
        break
      else
        puts "Uh oh! Looks like that didn't work."
        puts prompt
      end
    end
  end

  # SUGGESTED EVENTS --------------------------------------------------------

  def suggest_events
    puts '-------------------------------------------------------------------------------------------------'
    Event.suggested_events
    puts '-------------------------------------------------------------------------------------------------'
    prompt =
      "Would you like to 'reserve' a ticket for an event above, or 'start over' with another search?"
    puts prompt
    while user_input = gets.downcase.chomp
      case
      when user_input == 'reserve'
        self.reserve
        break
      when user_input == 'start over'
        self.events_page
        break
      else
        puts "Uh oh! Looks like that didn't work."
        puts prompt
      end
    end
  end

  # EVENTS NEARBY------------------------------------------------------------

  def events_nearby
    puts '------------------------------------------------------------------------------------------'
    postal_code = self.postal_code
    Event.postal_code_events(postal_code)
    puts '-------------------------------------------------------------------------------------------'
    prompt =
      "Would you like to 'reserve' a ticket for an event, or 'start over' with another search?"
    puts prompt
    while user_input = gets.downcase.chomp
      case
      when user_input == 'reserve'
        self.reserve
        break
      when user_input == 'start over'
        self.events_page
        break
      else
        puts "Uh oh! Looks like that didn't work."
        puts prompt
      end
    end
  end

  # RESERVE TICKETS----------------------------------------------------------

  def reserve
    puts '----------------------------------------------------'
    prompt1 = 'Which event date would you like to reserve?'
    puts prompt1
    date = gets.chomp
    begin
      Date.parse(date)
    rescue ArgumentError
      self.reserve
    end
    event = Event.event_by_date(date)
    puts '----------------------------------------------------'
    puts 'Are you sure this is the event you want to reserve?'
    event.pretty_event
    prompt2 = "'Yes' or 'search again'?"
    puts prompt2
    puts '----------------------------------------------------'
    while user_input = gets.downcase.chomp
      case
      when user_input == 'yes'
        puts '---------------------------------------------'
        puts 'How many tickets?'
        ticket_count = gets.chomp.to_i
        self.reserve_tickets(event, ticket_count)
        break
      when user_input == 'search again'
        self.events_page
        break
      else
        puts "Uh oh! Looks like that didn't work."
        puts prompt2
      end
    end
  end

  # VIEW PROFILE PAGE AND ALL SUB METHODS

  def view_profile
    puts '----------------------------------------------------------------------------------'
    puts 'Welcome to your Profile Page!'
    puts '----------------------------------------------------------------------------------'
    prompt =
      "Would you like to view your 'user info', see 'reserved tickets', or 'log out'?"
    puts prompt
    while user_input = gets.downcase.chomp
      case
      when user_input == 'user info'
        self.user_info
        break
      when user_input == 'reserved tickets'
        self.reserved_tickets
        break
      when user_input == 'log out'
        self.log_out
        break
      else
        puts "Uh oh! Looks like that didn't work."
        puts prompt
      end
    end
  end

  def user_info
    puts '--------------------------------------------------------------'
    puts "Username: #{self.username}"
    puts "Name: #{self.name}"
    puts "Postal Code: #{self.postal_code}"
    puts '--------------------------------------------------------------'
    self.welcome
  end
  # update info?

  # EXTRA USER METHODS

  def reserve_tickets(event, ticket_count)
    ticket =
      Ticket.create(
        user_id: self.id,
        event_id: event.id,
        ticket_count: ticket_count,
        event_name: event.event_name,
        date: event.date,
        venue_name: event.venue_name
      )
    event[:ticket_count] = (event.ticket_count -= ticket_count)
    event.save!
    puts 'Enjoy the show!'
    self.welcome
  end

  def log_out
    exit
  rescue SystemExit
    puts "See you later #{self.name}!"
  end

  def user_tickets
    Ticket.all.select { |ticket| ticket.user_id == self.id }
  end

  def reserved_tickets
    reserved = self.user_tickets
    if reserved.empty?
      puts '----------------------------------------------------------------------------------------------'
      puts "Looks like you don't have tickets."
      prompt = 'Would you like to search and reserve new tickets? Yes or no?'
      puts prompt
      puts '----------------------------------------------------------------------------------------------'
      while user_input = gets.downcase.chomp
        case
        when user_input == 'yes'
          self.search_events
          break
        when user_input == 'no'
          self.welcome
          break
        else
          puts "Uh oh! Looks like that didn't work."
          puts prompt
          puts '----------------------------------------------------------------------------------------------'
        end
      end
    else
      reserved.each do |ticket|
        puts '-----------------------------------------------------------------------------------------------------------------------'
        puts "This reservation contains #{
               ticket.ticket_count
             } ticket(s) to the event #{ticket.event_name}, on #{
               ticket.date
             } at #{ticket.venue_name}."
        puts '-----------------------------------------------------------------------------------------------------------------------'
      end
      self.welcome
    end
  end
end
