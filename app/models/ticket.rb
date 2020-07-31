class Ticket < ActiveRecord::Base
    belongs_to :user
    belongs_to :event
<<<<<<< HEAD
=======
    after_initialize :init

    def init
      self.ticket_count  ||= 0
    end
<<<<<<< HEAD
>>>>>>> second_repo
=======

    # def user_ticket
    #     Ticket.all.select {|ticket| ticket.user_id == self.id}
    # end

    # def event_ticket
    #   Ticket.all.select {|ticket| ticket.event_id == self.id}
    # end
>>>>>>> second_repo
end