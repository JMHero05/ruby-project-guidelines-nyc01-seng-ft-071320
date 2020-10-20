class Event < ActiveRecord::Base
  has_many :tickets
  has_many :users, through: :tickets
  after_initialize :init

  def init
    self.ticket_count ||= 100
  end

  def self.events_by_venue
    self.all.map(&:venue_name).uniq
  end

  def self.venue_events(name)
    events = self.all.select { |event| event.venue_name == name }
    events.select do |key, value|
      puts '--------------------------------------------------------------'
      puts "The event '#{key[:event_name]}' is happening on #{key[:date]}."
      puts '--------------------------------------------------------------'
    end
  end

  def self.events_by_event_name
    self.all.map(&:event_name).uniq
  end

  def self.name_events(name)
    events = self.all.select { |event| event.event_name == name }
    events.select do |key, value|
      puts '--------------------------------------------------------------'
      puts "The event '#{key[:event_name]}' is happening on #{key[:date]}."
      puts '--------------------------------------------------------------'
    end
  end

  def self.postal_code_events(postal_code)
    events = self.all.select { |event| event.postal_code == postal_code }
    events.select do |key, value|
      puts '--------------------------------------------------------------'
      puts "The event '#{key[:event_name]}' is happening on #{key[:date]}."
      puts '--------------------------------------------------------------'
    end
  end

  def self.all_events
    events = self.all
    events.select do |key, value|
      puts '--------------------------------------------------------------------------------------'
      puts "The event '#{key[:event_name]}' is happening on #{key[:date]}."
      puts "At '#{key[:venue_name]}'"
      puts "#{key[:venue_address]}, #{key[:venue_city]}, #{key[:venue_state]} #{
             key[:postal_code]
           }"
      puts '--------------------------------------------------------------------------------------'
    end
  end

  def self.suggested_events
    events = self.all.sample(3)
    events.select do |key, value|
      puts '--------------------------------------------------------------------------------------'
      puts "The event '#{key[:event_name]}' is happening on #{key[:date]}."
      puts "At '#{key[:venue_name]}'"
      puts "#{key[:venue_address]}, #{key[:venue_city]}, #{key[:venue_state]} #{
             key[:postal_code]
           }"
      puts '--------------------------------------------------------------------------------------'
    end
  end

  def self.event_by_date(date)
    self.all.find_by date: "#{date}"
  end

  def pretty_event
    puts '-----------------------------------------------------------------------------------'
    puts "'#{self.event_name}' on #{self.date}"
    puts "at '#{self.venue_name}'"
    puts "#{self.venue_address}, #{self.venue_city}, #{self.venue_state} #{
           self.postal_code
         }"
    puts '-----------------------------------------------------------------------------------'
  end
end
