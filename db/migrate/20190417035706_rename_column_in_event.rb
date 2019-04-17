class RenameColumnInEvent < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :start_time, :starttime
    rename_column :events, :end_time, :endtime
  end
end
