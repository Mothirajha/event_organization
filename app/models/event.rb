class Event < ApplicationRecord

  # Associations
  has_many :users_events
  has_many :users, through: :users_events

  # Validations
  validates :title, presence: true
  validates :starttime, presence: true
  validates :endtime, presence: true
  validate :end_time_greater_than_start_time

  def end_time_greater_than_start_time
    if starttime > endtime
      errors.add(:endtime, "can't be greater than starttime")
    end
  end

end