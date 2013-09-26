class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_current, :boolean
  end
end
