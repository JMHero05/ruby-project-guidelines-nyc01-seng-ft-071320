class Event < ActiveRecord::Base
    has_many :tickets
    has_many :users, through: :tickets
<<<<<<< HEAD
=======
    after_initialize :init

    def init
      self.ticket_count  ||= 100
    end
>>>>>>> second_repo

    def self.events_by_venue
        self.all.map {|event| event.venue_name}.uniq
    end

    def self.venue_events(name)
        events = self.all.select {|event| event.venue_name == name}
        events.select do |key, value| 
            puts "--------------------------------------------------------------"
            puts "The event '#{key[:event_name]}' is happening on #{key[:date]}."
            puts "--------------------------------------------------------------"
        end
    end

    def self.events_by_event_name
        self.all.map {|event| event.event_name}.uniq
    end

    def self.name_events(name)
        events = self.all.select {|event| event.event_name == name}
        events.select do |key, value| 
            puts "--------------------------------------------------------------"
            puts "The event '#{key[:event_name]}' is happening on #{key[:date]}."
            puts "--------------------------------------------------------------"
        end
    end

    # def self.events_by_postal_code
    #     self.all.map {|event| event.postal_code}
    # end

    def self.postal_code_events(postal_code)
        events = self.all.select {|event| event.postal_code == postal_code}
        events.select do |key, value| 
            puts "--------------------------------------------------------------"
            puts "The event '#{key[:event_name]}' is happening on #{key[:date]}."
            puts "--------------------------------------------------------------"
        end
    end

    def self.all_events
        events = self.all
        events.select do |key, value| 
            puts "--------------------------------------------------------------"
            puts "The event '#{key[:event_name]}' is happening on #{key[:date]}."
            puts "At '#{key[:venue_name]}'"
            puts "#{key[:venue_address]}, #{key[:venue_city]}, #{key[:venue_state]} #{key[:postal_code]}"
            puts "--------------------------------------------------------------"
        end
    end

    def self.suggested_events
        events = self.all.sample(3)
        events.select do |key, value| 
            puts "--------------------------------------------------------------"
            puts "The event '#{key[:event_name]}' is happening on #{key[:date]}."
            puts "At '#{key[:venue_name]}'"
            puts "#{key[:venue_address]}, #{key[:venue_city]}, #{key[:venue_state]} #{key[:postal_code]}"
            puts "--------------------------------------------------------------"
        end
    end


end