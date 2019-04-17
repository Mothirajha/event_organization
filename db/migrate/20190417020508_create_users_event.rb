class CreateUsersEvent < ActiveRecord::Migration[6.0]
  def change
    create_table :users_events do |t|
      t.references :user, null: false
      t.references :event, null: false
      t.integer :rsvp, null: false

      t.timestamps null: false
    end
  end
end
