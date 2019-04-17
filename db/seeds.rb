# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

users_filepath = Rails.public_path.to_s + '/users.csv'
events_filepath = Rails.public_path.to_s + '/events.csv'

# User.transaction do
#   CSV.foreach(users_filepath, headers: true) do |row|
#     user_hash = row.to_hash
#     user = User.new(user_hash)
#     user.password = SecureRandom.alphanumeric
#     user.save!
#   end
# end

# Event.transaction do
  CSV.foreach(events_filepath, headers: true) do |row|
    event_hash = row.to_hash
    rsvp_data = event_hash.delete("users#rsvp")
    begin
      event = Event.new(event_hash)
      event.save!
      if event.present? and rsvp_data.present?
        rsvp_data = rsvp_data.split(';')
        rsvp_data.each do |info|
          info = info.split('#')
          user = User.find_by(username: info[0])
          rsvp = info[1]
          users_event = UsersEvent.new({rsvp: rsvp})
          users_event.user = user
          users_event.event = event
          users_event.save
        end
      end   
    rescue Exception => e
      p e
      p event_hash
    end

  # end
end
  
