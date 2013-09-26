class AddIsAdminBooleanToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_admin, :boolean
    add_column :users, :display_name, :string
  end
end
