class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  after_initialize :init

  def init
    self.ticket_count ||= 0
  end
end
