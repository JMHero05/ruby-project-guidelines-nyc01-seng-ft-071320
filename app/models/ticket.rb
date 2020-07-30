class Ticket < ActiveRecord::Base
    belongs_to :user
    belongs_to :event
<<<<<<< HEAD
=======
    after_initialize :init

    def init
      self.ticket_count  ||= 0
    end
>>>>>>> second_repo
end