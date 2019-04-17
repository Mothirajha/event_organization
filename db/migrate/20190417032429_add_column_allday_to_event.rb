class AddColumnAlldayToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :allday, :boolean, default: false
  end
end
