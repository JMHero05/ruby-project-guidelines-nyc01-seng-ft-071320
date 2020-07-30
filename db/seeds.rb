require 'rest-client'
require 'json'
require 'pry'

Event.delete_all
Ticket.delete_all
User.delete_all
a = ENV["key"]

events_response = RestClient.get("https://app.ticketmaster.com/discovery/v2/events?apikey=#{a}&postalCode=10002&radius=1&unit=miles&locale=*&includeTBD=yes&sort=date,asc&countryCode=US&stateCode=NY")
events_data = JSON.parse(events_response)

# def events
#   events_data.map do |key, value|
#     value   
#   end
# end

event_name = []
venue_name = []
my_keys = [:event_name, :date, :venue_name, :venue_address, :venue_city, :venue_state, :postal_code]
events = []
events_data.each do |key, value|
  value.each do |key, value|
    if key == "events"
      value.each do |key|
        events << key["name"]
        events << key["dates"]["start"]["localDate"]
        events << key["_embedded"]["venues"][0]["name"]
        events << key["_embedded"]["venues"][0]["address"]["line1"]
        events << key["_embedded"]["venues"][0]["city"]["name"]
        events << key["_embedded"]["venues"][0]["state"]["stateCode"]
        events << key["_embedded"]["venues"][0]["postalCode"]
      end
    end  
  end  
end

all_events = [
event1 = my_keys.zip(events[0..6]).to_h,
event2 = my_keys.zip(events[7..13]).to_h,
event3 = my_keys.zip(events[14..20]).to_h,
event4 = my_keys.zip(events[21..27]).to_h,
event5 = my_keys.zip(events[28..34]).to_h,
event6 = my_keys.zip(events[35..41]).to_h,
event7 = my_keys.zip(events[42..48]).to_h,
event8 = my_keys.zip(events[49..55]).to_h,
event9 = my_keys.zip(events[56..62]).to_h,
event10 = my_keys.zip(events[63..69]).to_h,
event11 = my_keys.zip(events[70..76]).to_h,
event12 = my_keys.zip(events[77..83]).to_h,
event13 = my_keys.zip(events[84..90]).to_h,
event14 = my_keys.zip(events[91..97]).to_h]

all_events.each do |event_hash|
  event = Event.create(event_hash)
  # event.ticket_count = 100
  # binding.pry
end

# event_name = []
# events_data.each do |key, value|
#   value.each do |key, value|
#     if key == "events"
#       value.each do |key|
#         event_name << key["name"]
#       end
#     end  
#   end  
# end

# venue_name = []
# events_data.each do |key, value|
#   value.each do |key, value|
#     if key == "events"
#       value.each do |key|
#         venue_name << key["_embedded"]["venues"][0]["name"]
#       end
#     end  
#   end  
# end

# event_date = []
# events_data.each do |key, value|
#   value.each do |key, value|
#     if key == "events"
#       value.each do |key|
#         event_date << key["dates"]["start"]["localDate"]
#       end
#     end  
#   end
# end

# @in_event = events[0].map do |key, value|
#   value.each do |key, value|
#     if key == "name"
#       value
#     end  
#   end  
# end

# def event_names(index)
#   @in_event[0][index].map do |key, value|
#     if key == "name"
#       value
#     end
#   end
# end




# binding.pry
