class CreateEvent < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title,              null: false, default: ""
      t.text :description,         default: ""
      t.datetime :start_time,      null: false
      t.datetime :end_time,        null: false

      t.timestamps null: false
    end
  end
end
