class ChangeColumnNameInUser < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :name, :username
    rename_column :users, :mobile_number, :phone
  end
end
