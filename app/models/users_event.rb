class UsersEvent < ApplicationRecord

  enum rsvp: [ :yes, :no, :maybe ]

  # Associations
  belongs_to :user
  belongs_to :event

  # Validations

  # Callbacks
  after_commit :update_overlapping_events

  def update_overlapping_events
    events = Event.joins(:users_events).where("users_events.user_id = ? and users_events.rsvp = ?", self.user_id, 0).where("events.starttime between ? and ? or events.endtime between ? and ?", event.starttime, event.endtime, event.starttime, event.endtime).order("id desc").ids
    events.shift
    if events.present?
      UsersEvent.where("user_id = ? and event_id in (?)", self.user_id, events).update_all(rsvp: 1)
    end
    return true
  end


end