class UsersEvent < ApplicationRecord

  enum rsvp: [ :yes, :no, :maybe ]

  # Associations
  belongs_to :user
  belongs_to :event

  # Validations

  # Callbacks
  # after_save :update_overlapping_events

  def update_overlapping_events
    Event.where("starttime between ? and ? or endtime between ? and ?", self.event.starttime, self.event.endtime)
  end


end